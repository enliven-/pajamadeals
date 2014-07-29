class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @title = 'sign up'
    super
  end

  def create
    if user = User.find_by(mobile: params[:user][:mobile],
                           guest: true)
      user.update_attributes(sign_up_params.merge(guest: false))
      sign_in user, bypass: true
      redirect_to root_path
    else
      super
    end
  end

  protected
    def after_sign_up_path_for(resource)
      signed_in_root_path(resource)
    end

    def after_update_path_for(resource)
      signed_in_root_path(resource)
    end
end
