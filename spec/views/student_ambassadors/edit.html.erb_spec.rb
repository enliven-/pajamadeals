require 'rails_helper'

RSpec.describe "student_ambassadors/edit", :type => :view do
  before(:each) do
    @student_ambassador = assign(:student_ambassador, StudentAmbassador.create!(
      :name => "MyString",
      :mobile => "MyString",
      :year => "MyString",
      :branch => "MyString",
      :college => "MyString"
    ))
  end

  it "renders the edit student_ambassador form" do
    render

    assert_select "form[action=?][method=?]", student_ambassador_path(@student_ambassador), "post" do

      assert_select "input#student_ambassador_name[name=?]", "student_ambassador[name]"

      assert_select "input#student_ambassador_mobile[name=?]", "student_ambassador[mobile]"

      assert_select "input#student_ambassador_year[name=?]", "student_ambassador[year]"

      assert_select "input#student_ambassador_branch[name=?]", "student_ambassador[branch]"

      assert_select "input#student_ambassador_college[name=?]", "student_ambassador[college]"
    end
  end
end
