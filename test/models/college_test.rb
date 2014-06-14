require 'test_helper'

class CollegeTest < ActiveSupport::TestCase
  
  test "creates college with token" do
  	vit = build(:vit)

  	assert vit.valid?

  	vit.save

  	assert_not_nil vit.name
  	assert_not_nil vit.abbr
  	assert_not_nil vit.location
  	assert_not_nil vit.token

  end

end
