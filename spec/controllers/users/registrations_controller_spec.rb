require 'spec_helper'

describe Users::RegistrationsController, type: :controller do
  
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
  describe 'POST #create' do
    it 'retrives user, updates it and is no longer guest if user is present and 
       is guest' do
       user = create :user, email: 'email@example.com', guest: true,
              mobile: '9975454384'
      expect {
         post :create, user: attributes_for(:user, mobile: '9975454384',
                                        email: 'foo@example.com')
      }.not_to change{User.count}
      user.reload
      expect(current_user).to eq(user)
      expect(current_user).not_to be_guest
      expect(current_user.email).to eq('foo@example.com')
    end
    
    it 'behaves the normal wave if user does not exists' do
      expect {
         post :create, user: attributes_for(:user)
      }.to change{User.count}.by(1)
    end
  end
end