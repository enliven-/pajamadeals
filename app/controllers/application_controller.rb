class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include MongodbLogger::Base

  before_filter :add_params_to_mongodb_logger
  def add_params_to_mongodb_logger
  	if Rails.env.production? || Rails.env.developement?
  		Rails.logger.add_metadata(user_id: @current_user.id) if Rails.logger.respond_to?(:add_metadata)
	 end
  end

  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

end
