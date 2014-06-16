require 'test_helper'

class ClassifiedsControllerTest < ActionController::TestCase
  setup do
    @classified = create(:sell)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:classifieds)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create classified" do
  #   assert_difference('Classified.count') do
  #     post :create, classified: { college: @classified.college, description: @classified.description, image: @classified.image, price: @classified.expected_price, title: @classified.title, listing_type: @classified.listing_type, user: @classified.user }
  #   end

  #   assert_redirected_to classified_path(assigns(:classified))
  # end

  # test "should show classified" do
  #   get :show, id: @classified
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @classified
  #   assert_response :success
  # end

  # test "should update classified" do
  #   patch :update, id: @classified, classified: { description: @classified.description, image: @classified.image, price: @classified.expected_price, title: @classified.title, listing_type: @classified.listing_type, user: @classified.user }
  #   assert_redirected_to classified_path(assigns(:classified))
  # end

  # test "should destroy classified" do
  #   assert_difference('Classified.count', -1) do
  #     delete :destroy, id: @classified
  #   end

  #   assert_redirected_to classifieds_path
  # end
end
