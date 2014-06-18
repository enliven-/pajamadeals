require 'test_helper'

class CollegeTest < ActiveSupport::TestCase
  
  test "creates college with token" do
  	college = build(:college)

  	assert college.valid?
  	assert college.save
  	assert_not_nil college.token
  end

end
