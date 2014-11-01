require "rails_helper"

RSpec.describe StudentAmbassadorsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/student_ambassadors").to route_to("student_ambassadors#index")
    end

    it "routes to #new" do
      expect(:get => "/student_ambassadors/new").to route_to("student_ambassadors#new")
    end

    it "routes to #show" do
      expect(:get => "/student_ambassadors/1").to route_to("student_ambassadors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/student_ambassadors/1/edit").to route_to("student_ambassadors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/student_ambassadors").to route_to("student_ambassadors#create")
    end

    it "routes to #update" do
      expect(:put => "/student_ambassadors/1").to route_to("student_ambassadors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/student_ambassadors/1").to route_to("student_ambassadors#destroy", :id => "1")
    end

  end
end
