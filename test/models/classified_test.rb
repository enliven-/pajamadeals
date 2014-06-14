require 'test_helper'

class ClassifiedTest < ActiveSupport::TestCase
  
  test "creates classified for selling" do
  	college = create(:college)
  	user = create(:user, college: college)
  	sell_classified = create(:sell, user: user)

  	assert sell_classified.list?
  	assert sell_classified.sell?
  	assert !sell_classified.buy?
  	
  	assert_equal user, sell_classified.user
  	assert_equal college, sell_classified.college
  end

  test "creates classified for buying" do
  	buy_classified = create(:buy)

  	assert buy_classified.list?
  	assert buy_classified.buy?
  	assert !buy_classified.sell?
  end

  test "creates classified with image" do
  	ImageUploader.enable_processing = true
  	classified = create(:sell, image: File.open("#{Rails.root}/test/fixtures/test1.jpg"))

  	assert_not_nil classified.image.thumb

  	ImageUploader.enable_processing = false
  end



end
