class SessionsController < ApplicationController
  
  def create
     @user = User.from_omniauth(request.env["omniauth.auth"])
     sign_in(@user)
     
     respond_to do |format|
       format.js
       format.html do
         if !@user.mobile.present? || !@user.college.present?
           redirect_to edit_user_path(@user)
         else
           redirect_to :back rescue(redirect_to root_path)
         end
       end
     end
   end

   def destroy
     sign_out
     redirect_to root_path, notice: 'Signed out successfully'
   end
end
