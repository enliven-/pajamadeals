class ClassifiedsController < ApplicationController
  before_action :set_classified, only: [:show, :edit, :update, :destroy,
                                        :contact_seller, :booth_pickup]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  # GET /classifieds
  # GET /classifieds.json
  def index
    @title = "college classifieds"

    # filters
    if params[:filters].present? and params[:filters][:college_id].present?
      session[:college_id] = params[:filters][:college_id]
    end
    if params[:filters].present? and params[:filters][:category_id].present?
      session[:category_id] = params[:filters][:category_id]
    end

    # search query
    query = params[:query].present? ? params[:query] : '*'
    search_params = {}
    search_params[:operator] = 'or'
    search_params[:fields] = ["title^5", "description"]
    search_params[:page] = params[:page]
    search_params[:per_page] = 15
    search_params[:order] = { created_at: :desc }
    search_params[:where] = { list: true }
    search_params[:where][:college_id]  = current_college.id  if current_college
    search_params[:where][:category_id] = current_category.id if current_category

    @classifieds = Classified.search(query, search_params)

  end

  # GET /classifieds/1
  # GET /classifieds/1.json
  def show
    @title = @classified.title
  end

  # GET /classifieds/new
  def new
    @title = 'new classified'
    @classified = Classified.new
    @classified.build_user if !user_signed_in?
  end

  # GET /classifieds/1/edit
  def edit
    @title = @classified.title
    redirect_to root_path if @classified.user != current_user
  end

  # POST /classifieds
  # POST /classifieds.json
  def create

    if !user_signed_in?
      user_attributes = classified_params.delete(:user_attributes)
      user = User.find_by(mobile: user_attributes[:mobile])
      if user.present? and user.guest? and user_attributes[:email].present? and user_attributes[:password].present?
        user_attributes.delete(:mobile)
        user.update_attributes(user_attributes.merge(guest: false))
        sign_in user
      end
      if !user.present?
        if user_attributes[:email].present? and user_attributes[:password].present?
          user = User.create(user_attributes)
          sign_in user
        else
          user_attributes.merge!(password: "passwordpassword#{rand(20)}",
                                 email: "#{SecureRandom.hex(5)}@guest.com",
                                 guest: true
                                 )
          user = User.create(user_attributes)
        end
      end
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
                                       user_attributes: [:email, :mobile,
                                                         :name, :college_id,
                                                         :password]
                                       )
  end
end
