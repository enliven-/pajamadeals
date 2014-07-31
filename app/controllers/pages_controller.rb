class PagesController < ApplicationController
  def home
    @title = 'home'
    redirect_to classifieds_path if current_college
  end

  def about
  end

  def contact_us
  end
end
