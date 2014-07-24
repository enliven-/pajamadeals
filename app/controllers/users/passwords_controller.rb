class users::passwordsController < Devise::passwordsController
  # def new
  #   super
  # end

  # def create
  #   super
  # end
  protected
    def after_resetting_password_path_for(resource)
      signed_in_root_path(resource)
    end
end
