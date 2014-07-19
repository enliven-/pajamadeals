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
end
