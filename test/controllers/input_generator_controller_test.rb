require 'test_helper'

class InputGeneratorControllerTest < ActionDispatch::IntegrationTest
  test "authenticated user should get index" do
    sign_in create(:user)
    get input_generator_url
    assert_response :success
  end

  test "not authenticated user should get index" do
    get input_generator_url
    assert_response :success
  end
end
