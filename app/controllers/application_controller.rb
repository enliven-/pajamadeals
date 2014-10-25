class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 # protect_from_forgery with: :exception
 
  before_action do
    request.variant = :mobile if browser.mobile?
  end
  
  def filtering_params
    cookies.permanent[:college_id] = params[:filters][:college_id] if params[:filters].present? && params[:filters][:college_id].present?
  end
  before_action :filtering_params
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end
  helper_method :current_user
  
  def user_signed_in?
    !!current_user
  end
  helper_method :user_signed_in?
  
  def sign_in(user)
    session[:user_id] = user.id
  end
  
  def sign_out
    session.delete(:user_id)
  end

  def current_college
    @current_college =
      (College.find(cookies[:college_id]) if cookies[:college_id].present?) ||
      current_user.try(:college)
  end
  helper_method :current_college
  
  def authenticate_user!
    access_denied if !user_signed_in?
  end

  def authenticate_role!(*args)
    if user_signed_in?
      return true if args.include?(current_user.role.to_sym)
    end
    access_denied
  end
  
  def authenticate_owner!(record)
    if user_signed_in?
      return true if current_user.owner?(record) || current_user.admin?
    end
    access_denied                
  end
  
  def authenticate_admin_user! #use predefined method name
    if user_signed_in?
      return true if current_user.admin?
    end
    access_denied
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
  
  def admin_layout
    render layout: 'admin_layout'
  end
  
  def mobile_device?
    request.user_agent =~ /Mobile|webOS|Opera|UCBrowser/
  end
  helper_method :mobile_device?
  
  include MongodbLogger::Base
  before_filter :add_params_to_mongodb_logger
  def add_params_to_mongodb_logger
    if Rails.logger.respond_to?(:add_metadata) && Rails.env.production?
      Rails.logger.add_metadata(user_id: current_user.try(:id))
    end
  end
  
end