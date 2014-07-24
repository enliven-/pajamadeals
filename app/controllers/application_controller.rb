class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include MongodbLogger::Base

  before_filter :add_params_to_mongodb_logger
  def add_params_to_mongodb_logger
    if Rails.logger.respond_to?(:add_metadata)
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
    devise_parameter_sanitizer.for(:sign_up).push(:email, :mobile_number, :name,
                                                  :college_id, :college)
  end
end
