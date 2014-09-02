class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { render :edit,
                      notice: 'Successfully updated.' }
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
