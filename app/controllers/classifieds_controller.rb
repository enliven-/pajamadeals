class ClassifiedsController < ApplicationController
  before_action :set_classified, only: [:show, :edit, :update, :destroy,
                                        :contact_seller, :booth_pickup]
  before_action ->{ authenticate_owner!(set_classified) },
                  only: [:edit, :update, :destroy]
    
  # GET /classifieds
  # GET /classifieds.json
  def index
    @title = "College Classifieds"

    # filters
    if params[:filters].present?
      session[:college_id] = params[:filters][:college_id]
    end
   
    # search query
    query = params[:q].present? ? params[:q] : '*'
    search_params = {}
    search_params[:operator] = 'or'
    search_params[:fields] = ["title^5", "description"]
    search_params[:page] = params[:page]
    search_params[:per_page] = 30
    search_params[:order] = { created_at: :desc }
    search_params[:where] = { list: true }
    
    if current_college
      college_ids = College.search('*', where: {location: {near: 
        [current_college.latitude, current_college.longitude], within: "5km"}})
        .map(&:id)
      search_params[:where][:college_id] = college_ids
    end
    
    if params[:filters] && params[:filters][:category_id].present?
      search_params[:where][:category_id] = params[:filters][:category_id]
    end

    @classifieds = Classified.search(query, search_params)
    
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @title = @classified.title
  end

  def new
    @title = 'new classified'
    @classified = Classified.new(listing_type: params[:listing_type])
    @classified.build_user if !user_signed_in?
  end

  def edit
    @title = @classified.title
  end

  def create
    
    if !user_signed_in?
      user_attributes = classified_params.delete(:user_attributes)
      user = User.find_by(mobile: user_attributes[:mobile])
      if (user.present? && user.guest? && user_attributes[:email].present? \
        && user_attributes[:password].present?)
        user_attributes.delete(:mobile)
        user.update_attributes(user_attributes.merge(guest: false))
        sign_in user
      end
      if !user.present?
        if user_attributes[:email].present? && user_attributes[:password].present?
          user = User.create(user_attributes)
          sign_in user
        else
          user_attributes.merge!(password: "passwordpassword#{rand(20)}",
                                 email:    "#{SecureRandom.hex(5)}@guest.com",
                                 guest:    true
                                 )
          user = User.create(user_attributes)
        end
      end
    end

    @classified = Classified.new(classified_params)
    @classified.user = current_user || user

    respond_to do |format|
      if @classified.save
        session[:category_id] = @classified.category.try(:id)

        format.html { redirect_to classifieds_url,
                      notice: 'Classified was successfully created.' }
        format.json { render :show, status: :created, location: @classified }
      else
        format.html { render :new }
        format.json { render json: @classified.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @classified.update(classified_params)
        format.html { redirect_to classifieds_url,
                      notice: 'Classified was successfully updated.' }
        format.json { render :show, status: :ok, location: @classified }
      else
        format.html { render :edit }
        format.json { render json: @classified.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @classified.update_attribute(:list, false)
    respond_to do |format|
      format.html { redirect_to classifieds_url,
                    notice: 'Classified was successfully deleted.' }
      format.json { head :no_content }
    end
  end


  def autocomplete
    render json: Classified.search(params[:query], fields: [:title], limit: 10).map(&:title)
  end

  private

  def set_classified
    @classified = Classified.find(params[:id])
  end

  def classified_params
    params.require(:classified).permit(:title, :description, :category_id,
                                       :price, :image, :listing_type,
                                       user_attributes: [:email, :mobile,
                                                         :name, :college_id,
                                                         :password]
                                       )
  end
end
