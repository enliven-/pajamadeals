class ClassifiedsController < ApplicationController
  before_action :set_classified, only: [:show, :edit, :update, :destroy,
                                        :contact_seller, :booth_pickup]

  # GET /classifieds
  # GET /classifieds.json
  def index
    if params[:book_id]
      @classifieds =  Classified.paginate( page: params[:page], per_page: 30).
        order('created_at DESC').where(book_id: params[:book_id])
    else
      @classifieds =  Classified.paginate( page: params[:page], per_page: 30).
        order('created_at DESC')
    end
    if @classifieds.length == 0
      render 'shared/_no_results'
    end
  end

  # GET /classifieds/1
  # GET /classifieds/1.json
  def show
  end

  # GET /classifieds/new
  def new
    @classified = Classified.new
    @classified.build_book
    @classified.images.build
    @classified.build_user if !user_signed_in?
  end

  # GET /classifieds/1/edit
  def edit
  end

  # POST /classifieds
  # POST /classifieds.json
  def create
    book_attributes = classified_params.delete(:book_attributes)
    book = Book.find_or_create_by(book_attributes)

    if !user_signed_in?
      user_attributes = classified_params.delete(:user_attributes)
      user = User.find_by(mobile_number: user_attributes[:mobile_number]) ||
        User.create(user_attributes.merge({password: "passwordpassword#{rand(20)}",
                                           email: "#{SecureRandom.hex(5)}@guest.com",
                                           guest: true}))
        end

    @classified = Classified.new(classified_params)
    @classified.book = book
    @classified.user = current_user || user

    respond_to do |format|
      if @classified.save

        # upload images
        if params[:images].present?
          params[:images]['file'].each do |image|
            @classified.images.create(file: image)
          end
        end

        format.html { redirect_to @classified,
                      notice: 'Classified was successfully created.' }
        format.json { render :show, status: :created, location: @classified }
      else
        format.html { render :new }
        format.json { render json: @classified.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classifieds/1
  # PATCH/PUT /classifieds/1.json
  def update
    respond_to do |format|
      if @classified.update(classified_params)
        format.html { redirect_to @classified,
                      notice: 'Classified was successfully updated.' }
        format.json { render :show, status: :ok, location: @classified }
      else
        format.html { render :edit }
        format.json { render json: @classified.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classifieds/1
  # DELETE /classifieds/1.json
  def destroy
    @classified.destroy
    respond_to do |format|
      format.html { redirect_to classifieds_url,
                    notice: 'Classified was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def contact_seller
    @classified.contact_sellers.create(contact_seller_params)
    # render @classified, notice: 'Message sent to seller'
    render text: 'Message sent to seller'
  end

  def booth_pickup
    @classified.picks.create(booth_pickup_params)
    # render @classified, notice: 'Message sent to seller'
    render text: 'Booth pick up confirmed.'
  end

  private

  def set_classified
    @classified = Classified.find(params[:id])
  end

  def classified_params
    params.require(:classified).permit(:title, :description, :image,
                                       :expected_price, :listing_type, :status,
                                       :pattern, :comment,
                                       :retail_price,
                                       book_attributes: [:title, :publisher,
                                                         :author, :edition,
                                                         ],
                                       user_attributes: [:email, :mobile_number,
                                                         :name, :college_id]
                                       )
  end

  def contact_seller_params
    params.require(:contact_seller).permit(:name, :phone, :message)
  end

  def booth_pickup_params
    params.require(:pick).permit(:message, :name, :phone, :college_id, :college,
                                 :email)
  end

end
