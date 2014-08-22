class PagesController < ApplicationController
  
  before_action ->{ authenticate_roles!(:admin, :ambassador) }, only: [:stats]
  before_filter :admin_layout, only: [:stats]
  
  def home
    @title = 'Classifieds for students'
    redirect_to classifieds_path if current_college
  end

  def about
  end

  def contact_us
  end
  
  def stats
    @title = 'stats'
  end
end
