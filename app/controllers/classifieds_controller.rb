class ClassifiedsController < ApplicationController
  before_action :set_classified, only: [:show, :edit, :update, :destroy,
                                        :contact_seller, :booth_pickup]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  # GET /classifieds
  # GET /classifieds.json
  def index
    if params[:query].present?
      @classifieds = Classified
      .paginate(page: params[:page], per_page: 15)
      .order('created_at DESC')
      .where(list: true)
      .search(params[:query],
              operator: "or",
              fields:   ["title^5", "description"])
    else
      @classifieds = Classified
      .paginate(page: params[:page], per_page: 15)
      .order('created_at DESC')
      .where(list: true)
    end
  end

  # GET /classifieds/1
  # GET /classifieds/1.json
  def show
  end

  # GET /classifieds/new
  def new
    @classified = Classified.new
    @classified.build_user if !user_signed_in?
  end

  # GET /classifieds/1/edit
  def edit
  end

  # POST /classifieds
  # POST /classifieds.json
  def create
    if !user_signed_in?
      user_attributes = classified_params.delete(:user_attributes)
      user = User.find_by(mobile_number: user_attributes[:mobile_number]) ||
        User.create(user_attributes.merge({password: "passwordpassword#{rand(20)}",
                                           email: "#{SecureRandom.hex(5)}@guest.com",
                                           guest: true}))
        end

    @classified = Classified.new(classified_params)
    @classified.user = current_user || user

    respond_to do |format|
      if @classified.save

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
    @classified.update_attribute(:list, false)
    respond_to do |format|
      format.html { redirect_to classifieds_url,
                    notice: 'Classified was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_classified
    @classified = Classified.find(params[:id])
  end

  def classified_params
    params.require(:classified).permit(:title, :description, :category_id,
                                       :price,
                                       user_attributes: [:email, :mobile_number,
                                                         :name, :college_id]
                                       )
  end
end
