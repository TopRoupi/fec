require 'test_helper'

class InputGeneratorControllerTest < ActionDispatch::IntegrationTest
  test "an authenticated user should get index" do
    sign_in create(:user)
    get input_generator_url
    assert_response :success
  end

  test "a unauthenticated user should get index" do
    get input_generator_url
    assert_response :success
  end
end
