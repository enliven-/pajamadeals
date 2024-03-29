require 'spec_helper'

describe ClassifiedsController, type: :controller do
  describe 'GET #index' do
    it 'populates an array of classifieds' do
      classified = create :classified
      Classified.reindex
      get :index
      expect(assigns(:classifieds)).to match_array [classified]
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end

    it 'populates an array of classifieds with matched search term' do
      user = create :user
      drafter = create :classified, title: 'Drafter for sale', user: user
      computer = create :classified, title: 'Computer for sale', user: user
      Classified.reindex
      get :index, q: 'Drafter'
      
      expect(assigns(:classifieds)).to include(drafter)
      expect(assigns(:classifieds)).not_to include(computer)
    end
    
    it 'geospatially searches for classifieds' do
      vit  = create :vit
      viit = create :viit
      mit  = create :mit
      user1 = create :user, email: 'foo1@foo.com', mobile: '9999999991',
                     college: vit
      user2 = create :user, email: 'foo2@foo.com', mobile: '9999999992',
                     college: viit
      user3 = create :user, email: 'foo3@foo.com', mobile: '9999999993',
                     college: mit
      drafter1 = create :classified, title: 'Drafter for sale', user: user1
      drafter2 = create :classified, title: 'drafter for sale', user: user2
      drafter3 = create :classified, title: 'drafter for sale', user: user3
      Classified.reindex
      College.reindex
      
      get :index, filters: { college_id: vit.id }
      
      expect(assigns(:classifieds)).to include(drafter1)
      expect(assigns(:classifieds)).to include(drafter2)
      expect(assigns(:classifieds)).not_to include(drafter3)
    end
  end
  
  describe 'GET #new' do
    it "assigns a new Message to @message" do
      get :new
      expect(assigns(:classified)).to be_a_new(Classified)
    end
    
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      context "user signed in" do
        it "create classifieds with signed in user" do
          user = create :user
          sign_in user
          post :create, classified: attributes_for(:classified)
          classified = assigns(:classified)

          expect(Classified.all).to include(classified)
          expect(classified.user).to eq(user)
        end
      end
      
      context "user not signed in" do
        context "user exists in dababase" do
          it 'creates classified' do
            user = create :user
            post :create, classified: attributes_for(:classified)
                                    .merge(user_attributes: attributes_for(:user))
            classified = assigns(:classified)
                                  
            expect(Classified.all).to include(classified)
            expect(classified.user).to eq(user)
          end
        end
        
        context "user does not exists in database" do
          it "creates classified and user (guest)" do
            post :create, classified: attributes_for(:classified)
                                  .merge(user_attributes: attributes_for(:user))
            classified = assigns(:classified)

            expect(Classified.all).to include(classified)
            expect(User.all).to include(classified.user)
            expect(classified.user).to be_guest
          end
        end
      end
    end
    
    context 'with invalid attributes' do
      before(:each) do
        user = create :user
        sign_in user
      end
      
      it "does not save the new classified in the database" do
        expect{
          post :create, classified: attributes_for(:classified).except(:title)
        }.to_not change(Classified, :count)
      end
      
      it "re-renders the :new template" do
        post :create, classified: attributes_for(:classified).except(:title)
        expect(response).to render_template :new
      end
    end
  end
  
  describe "DELETE #destroy" do
    before(:each) do
      @user = create :user
      sign_in @user
    end
    
    it "verifies user ownership of the record" do
      user2 = create :user, mobile: '9987612345'
      classified = create :classified, user: user2
      delete :destroy, id: classified
      expect(response).to redirect_to(root_url)
    end
    
    it "marks record as deleted" do
      classified = create :classified, user: @user
      delete :destroy, id: classified
      expect(classified.reload.deleted?).to be_truthy
    end
    
    it "persists the deleted record in database" do
      classified = create :classified, user: @user
      expect{
        delete :destroy, id: classified
      }.to_not change(Classified, :count)
    end
  end
end