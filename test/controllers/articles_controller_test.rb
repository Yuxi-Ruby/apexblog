require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, { 'id' => articles(:valid).id }
    assert_response :success
  end
end
