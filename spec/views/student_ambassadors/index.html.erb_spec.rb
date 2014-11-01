require 'rails_helper'

RSpec.describe "student_ambassadors/index", :type => :view do
  before(:each) do
    assign(:student_ambassadors, [
      StudentAmbassador.create!(
        :name => "Name",
        :mobile => "Mobile",
        :year => "Year",
        :branch => "Branch",
        :college => "College"
      ),
      StudentAmbassador.create!(
        :name => "Name",
        :mobile => "Mobile",
        :year => "Year",
        :branch => "Branch",
        :college => "College"
      )
    ])
  end

  it "renders a list of student_ambassadors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Year".to_s, :count => 2
    assert_select "tr>td", :text => "Branch".to_s, :count => 2
    assert_select "tr>td", :text => "College".to_s, :count => 2
  end
end
