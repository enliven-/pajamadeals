require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "creates user" do
  	user = build(:user)

  	assert user.valid?
  	assert user.save
  	assert user.active
  	assert_not_nil user.token
  	assert_not user.admin?
  end

  test "creates admin user" do
  	user = create(:admin)

  	assert user.valid?
  	assert user.admin?
  end
end
