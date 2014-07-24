class Users::RegistrationsController < Devise::RegistrationsController

  def create
    if user = User.find_by(mobile_number: params[:user][:mobile_number],
                           guest: true)
      user.update_attributes(params[:user].merge(guest: false))
      sign_in user
    else
      super
    end
  end
end
