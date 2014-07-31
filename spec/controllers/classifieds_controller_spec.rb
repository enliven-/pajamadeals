require 'spec_helper'

describe ClassifiedsController, type: :controller do
  # describe 'GET #index' do
  #   it 'populates an array of classifieds' do
  #     classified = create :classified
  #     get :index
  #     expect(assigns(:classifieds)).to match_array [classified]
  #   end

  #   it "renders the :index view" do
  #     get :index
  #     expect(response).to render_template(:index)
  #   end

  #   it 'populates an array of classifieds with matched search term' do
  #     user = create :user
  #     drafter = create :classified, title: 'Drafter for sale', user: user
  #     computer = create :classified, title: 'Computer for sale', user: user
  #     Classified.searchkick_index.refresh
  #     get :index, query: 'Drafter'
  #     expect(assigns(:classifieds)).to include(drafter)
  #     expect(assigns(:classifieds)).not_to include(computer)
  #   end
  # end

  describe 'POST #create' do

    it 'creates classified with registered user' do
      user = create :user
      sign_in user
      post :create, classified: attributes_for(:classified)
      classified = assigns(:classified)

      expect(Classified.all).to include(classified)
      expect(classified.user).to eq(user)
    end

    it 'user not present, creates classified with guest user if email and password not present' do
      post :create, classified: attributes_for(:classified).merge(user_attributes: attributes_for(:user).except(:email, :password))
      classified = assigns(:classified)

      expect(Classified.all).to include(classified)
      expect(User.all).to include(classified.user)
      expect(classified.user).to be_guest
      expect(user_signed_in?).to be(false)
    end

    it 'user not present, creates classified and user if email and password are present' do
      post :create, classified: attributes_for(:classified).merge(user_attributes: attributes_for(:user))
      classified = assigns(:classified)

      expect(Classified.all).to include(classified)
      expect(User.all).to include(classified.user)
      expect(classified.user).not_to be_guest
      expect(user_signed_in?).to be(true)
      expect(current_user).to eq(classified.user)
    end

    it 'user present, creates classified and converts existing guest user to registered user if email and password present' do
      user = create :user, guest: true
      post :create, classified: attributes_for(:classified).merge(user_attributes: attributes_for(:user))
      classified = assigns(:classified)

      expect(Classified.all).to include(classified)
      expect(User.all).to include(classified.user)
      expect(classified.user).not_to be_guest
      expect(user_signed_in?).to be(true)
      expect(current_user).to eq(classified.user)
    end
  end
end
