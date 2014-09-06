class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  def edit
  end
  
  def update
    
    if !@user.mobile.present? && user = User.find_by(user_params[:mobile])
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
        format.html { redirect_to :back }
        format.json { render :show, status: :ok, location: @user }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @user.errors,
                      status: :unprocessable_entity }
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
  
end
