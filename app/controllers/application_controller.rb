class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home
    render "pages/home"
  end

  def current_college
    return nil if session[:college_id] == 0 || session[:college_id] == '0'
    @current_college =
      (College.find(session[:college_id]) if session[:college_id].present?) ||
      current_user.try(:college) rescue nil
  end
  helper_method :current_college

  def current_category
    return nil if session[:category_id] == 0 || session[:category_id] == '0'
    @current_category =
      Category.find(session[:category_id]) if session[:category_id].present?
  rescue Exception => e
    nil
  end
  helper_method :current_category

  include MongodbLogger::Base
  before_filter :add_params_to_mongodb_logger
  def add_params_to_mongodb_logger
    if Rails.logger.respond_to?(:add_metadata) and !Rails.env.test?
      Rails.logger.add_metadata(user_id: current_user.try(:id))
    end
  end

  def after_sign_in_path_for(resource)
    sign_in_url = url_for(action: 'new', controller: 'sessions', only_path: false,
                          protocol: 'http')
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

  def authenticate_admin_user! #use predefined method name
    redirect_to '/' and return if user_signed_in? && !current_user.admin?
    authenticate_user!
  end

  def current_admin_user #use predefined method name
    return nil if user_signed_in? && !current_user.admin?
    current_user
  end

  before_action :configure_devise_permitted_params, if: :devise_controller?
  def configure_devise_permitted_params
    devise_parameter_sanitizer.for(:sign_up).push(:email, :mobile, :name,
                                                  :college_id, :college)
  end

  def state
    current_college_id = (current_college and current_college.id) || 0
    current_category_id = (current_category and current_category.id) || 0

    render json: { current_college_id: current_college_id, current_category_id: current_category_id }
  end
end
