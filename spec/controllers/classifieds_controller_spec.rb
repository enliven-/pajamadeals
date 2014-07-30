require 'spec_helper'

describe ClassifiedsController, type: :controller do
  describe 'GET #index' do
    it 'populates an array of classifieds' do
      classified = create :classified
      get :index
      expect(assigns(:classifieds)).to match_array [classified]
    end
  end
end
