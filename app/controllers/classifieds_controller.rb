class ClassifiedsController < ApplicationController
  before_action :set_classified, only: [:show, :edit, :update, :destroy,
                                        :contact_seller, :booth_pickup]
  before_action ->{ authenticate_owner!(set_classified) },
                  only: [:edit, :update, :destroy]
    
  # GET /classifieds
  # GET /classifieds.json
  def index
    # query
    query = params[:q].present? ? params[:q] : '*'
    
    # default params
    search_params = {}
    search_params[:operator]     = 'or'
    search_params[:fields]       = ["title"]
    search_params[:page]         = params[:page]
    search_params[:per_page]     = 30
    search_params[:order]        = { created_at: :desc }
    search_params[:where]        = { list: true }
    search_params[:where][:sold] = false
    search_params[:where][:deleted] = false
    
    
    # filters
    if params[:filters].present?
      cookies[:college_id] = params[:filters][:college_id]
      
      if params[:filters][:category_id].present?
        search_params[:where][:category_id] = params[:filters][:category_id]
      end
      
      if params[:filters][:user]
        search_params[:where][:user_id] = current_user.id
      end
      
      if params[:filters][:listing_type].present?
        search_params[:where][:listing_type] = params[:filters][:listing_type]
      end
    end
    
    search_params[:where][:college_id] = current_college.id if current_college
    #search_params[:where][:college_id] = 1
    # geo location
    # if current_college
#       college_ids = College.search('*', where: {location: {near: [current_college.latitude, current_college.longitude], within: "5km"}}).map(&:id)
#       search_params[:where][:college_id] = college_ids
#     end

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
  end

  def edit
    @title = @classified.title
  end

  def create
    @classified = Classified.new(classified_params)
    @classified.user = current_user

    respond_to do |format|
      if @classified.save
        format.html { redirect_to classified_url(@classified),
                      notice: 'Classified was successfully created.' }
        format.json { render :show, status: :created, location: @classified }
        format.js   { render js:
                   "window.location.pathname='#{classified_path(@classified)}'"}
        
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
        format.html { redirect_to classified_path(@classified),
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
    @classified.delete!
    sleep(1)
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
                                       :price, :image, :listing_type, :sold,
                                       :image_cache,
                                       user_attributes: [:email, :mobile,
                                                         :name, :college_id,
                                                         :password]
                                       )
  end
end
