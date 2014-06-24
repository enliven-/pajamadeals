class ClassifiedsController < ApplicationController
  # before_action :set_classified, only: [:show, :edit, :update, :destroy]

  # GET /classifieds
  # GET /classifieds.json
  def index
	  # @search = Classified.search do
		 #  fulltext params[:search]

		 #  # with :college_id, current_user.college_id ||
			# 	#     session[:college_id]    ||
			# 	#     params[:college_id]
		 #  # with :listing_type, params[:listing_type]
		 #  # order_by :created_at, :desc
		 #  # paginate per_page: 15
	  # end
	 # @classifieds = @search.results
    @classifieds = Classified.all
  end

  # GET /classifieds/1
  # GET /classifieds/1.json
  def show
  end

  # GET /classifieds/new
  def new
    @classified = Classified.new
  end

  # GET /classifieds/1/edit
  def edit
  end

  # POST /classifieds
  # POST /classifieds.json
  def create
    @classified = Classified.new(classified_params)

    respond_to do |format|
      if @classified.save
        format.html { redirect_to @classified, notice: 'Classified was successfully created.' }
        format.json { render :show, status: :created, location: @classified }
      else
        format.html { render :new }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classifieds/1
  # PATCH/PUT /classifieds/1.json
  def update
    respond_to do |format|
      if @classified.update(classified_params)
        format.html { redirect_to @classified, notice: 'Classified was successfully updated.' }
        format.json { render :show, status: :ok, location: @classified }
      else
        format.html { render :edit }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classifieds/1
  # DELETE /classifieds/1.json
  def destroy
    @classified.destroy
    respond_to do |format|
      format.html { redirect_to classifieds_url, notice: 'Classified was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classified
      @classified = Classified.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classified_params
      params.require(:classified).permit(:title, :description, :image, :user_id, :college_id, :expected_price, :listing_type, :status)
    end
end
