require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "creates user" do
  	ankush = build(:ankush)

  	assert ankush.valid?

  	ankush.save

  	assert ankush.active
  	assert_not_nil ankush.token
  end
end
