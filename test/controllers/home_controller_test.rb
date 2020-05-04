require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "authenticated user should get index" do
    sign_in create(:user)
    get home_url
    assert_response :success
  end

  test "not authenticated user should get index" do
    get home_url
    assert_response :success
  end
end
