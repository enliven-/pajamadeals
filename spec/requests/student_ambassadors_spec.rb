require 'rails_helper'

RSpec.describe "StudentAmbassadors", :type => :request do
  describe "GET /student_ambassadors" do
    it "works! (now write some real specs)" do
      get student_ambassadors_path
      expect(response.status).to be(200)
    end
  end
end
