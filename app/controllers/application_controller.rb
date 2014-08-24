class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end
  helper_method :current_user
  
  def user_signed_in?
    !!current_user
  end
  helper_method :user_signed_in?

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
    if Rails.logger.respond_to?(:add_metadata) && Rails.env.production?
      Rails.logger.add_metadata(user_id: current_user.try(:id))
    end
  end

  def after_sign_in_path_for(resource)
    sign_in_url = url_for(action:     'new',
                          controller: 'sessions',
                          only_path:  false,
                          protocol:   'http')
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

  def after_sign_out_path_for(resource)
    sign_out_url = url_for(action:     'destroy',
                           controller: 'sessions',
                           only_path:  false,
                           protocol:   'http')
    if request.referer == sign_out_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

  def authenticate_role!(*args)
    access_denied if user_signed_in? && !args.include?(current_user.role.to_sym)
    authenticate_user!
  end
  
  def authenitcate_owner!(record)
    access_denied if user_signed_in? && 
                    (record.user != current_user || !authenticate_role!(:admin))
  end
  
  def authenticate_admin_user! #use predefined method name
    access_denied if !authenticate_role!(:admin)
  end
  
  def current_admin_user #use predefined method name
    return nil if !authenticate_admin_user!
    current_user
  end

  def access_denied
    flash[:error] = "Access denied"
    redirect_to '/'
  end

  # before_action :configure_devise_permitted_params, if: :devise_controller?
#   def configure_devise_permitted_params
#     devise_parameter_sanitizer.for(:sign_up).push(:email, :mobile, :name,
#                                                   :college_id, :college)
#   end

  def state
    current_college_id = (current_college and current_college.id) || 0
    current_category_id = (current_category and current_category.id) || 0

    render json: { current_college_id:  current_college_id,
                   current_category_id: current_category_id }
  end
  
  def admin_layout
    render layout: 'admin_layout'
  end
end
