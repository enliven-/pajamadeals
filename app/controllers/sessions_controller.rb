class SessionsController < ApplicationController
  def create
    #raise 1.inspect
     @user = User.from_omniauth(env["omniauth.auth"])
     sign_in(@user)
     respond_to do |format|
       format.js
       format.html { redirect_to root_path, notice: 'Signed in successfully.'}
     end
   end

   def destroy
     sign_out
     redirect_to root_url
   end
end
