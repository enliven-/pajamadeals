require 'spec_helper'

describe PagesController, type: :controller do
  
  describe 'GET #home' do  
    it 'has a 200 status' do
      get :home
      expect(response.status).to eq(200)
    end
    
    it 'redirects to classifieds#index if once visited home page' do
      college = create :college
      session[:college_id] = college.id
      get :home
      
      expect(response.status).to eq(302)
      expect(response).to redirect_to(classifieds_path)
    end
  end
  
  describe 'GET #stats' do
    it 'requires login' do
      get :stats
      expect(response.status).to eq(302)
      expect(response).to redirect_to new_user_session_path
    end
    
    it 'denies access if user is a (role) user' do
      user = create :user, role: :user
      sign_in(user)
      
      get :stats
      expect(response.status).to eq(302)
      expect(response).to redirect_to root_url
    end
    
    it 'gives access if user is an admin' do
      user = create :user, role: :admin
      sign_in(user)
      
      get :stats
      expect(response.status).to eq(200)
      expect(response).to render_template :stats
    end
    
    it 'gives access if user is an ambassador' do
      user = create :user, role: :ambassador
      sign_in(user)
      
      get :stats
      expect(response.status).to eq(200)
      expect(response).to render_template :stats
    end
  end
  
end