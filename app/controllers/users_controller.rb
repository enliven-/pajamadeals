class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  before_action ->{ authenticate_owner!(set_user) },
                  only: [:edit, :update]
  
  def edit
  end
  
  def update
    
    if !@user.mobile.present? && user = User.find_by(mobile: user_params[:mobile])
      attributes = @user.attributes
      attributes.delete("id")
      attributes.delete("role")
      @user.destroy
      user.update_attributes attributes
      @user = user
      sign_in(@user)
    end
      
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_url }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:mobile, :college_id, :name, :email)
  end
  
  def authenticate_owner!(user)
    if user_signed_in?
      return true if current_user == user
    end
    access_denied
  end
  
end
