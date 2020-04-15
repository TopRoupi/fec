require 'test_helper'

class InputGeneratorControllerTest < ActionDispatch::IntegrationTest
  test "should get /input-generator" do
    get input_generator_url
    assert_response :success
  end

end
