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

  before_filter :store_location
  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      if request.format == "text/html" || request.content_type == "text/html"
        session[:previous_url] = request.fullpath
        session[:last_request_time] = Time.now.to_i
      end
    end
  end

  def after_sign_in_path_for(resource)
    if session[:last_request_time] > (Time.now.to_i - 15*60)
      session[:previous_url] || root_path
    end
  end
end
