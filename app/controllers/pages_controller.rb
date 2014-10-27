class PagesController < ApplicationController
  
  before_action ->{ authenticate_role!(:admin, :ambassador) }, only: [:stats]
  before_filter :admin_layout, only: [:stats]
  
  def home
    redirect_to classifieds_path and return if !browser.mobile?
    @title = 'Classifieds for students'
    redirect_to pages_categories_path if current_college
  end
  
  def stats
    @title = 'stats'
  end
  
  def categories
  end
  
  def privacypolicy
    @title = 'Privacy Policy'
  end
end
