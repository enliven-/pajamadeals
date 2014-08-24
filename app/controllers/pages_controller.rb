class PagesController < ApplicationController
  
  before_action ->{ authenticate_role!(:admin, :ambassador) }, only: [:stats]
  before_filter :admin_layout, only: [:stats]
  
  def home
    session[:user_id] = nil
    @title = 'Classifieds for students'
    redirect_to classifieds_path if current_college
  end
  
  def stats
    @title = 'stats'
  end
end
