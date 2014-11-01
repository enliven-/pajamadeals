require 'rails_helper'

RSpec.describe "student_ambassadors/show", :type => :view do
  before(:each) do
    @student_ambassador = assign(:student_ambassador, StudentAmbassador.create!(
      :name => "Name",
      :mobile => "Mobile",
      :year => "Year",
      :branch => "Branch",
      :college => "College"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Year/)
    expect(rendered).to match(/Branch/)
    expect(rendered).to match(/College/)
  end
end
