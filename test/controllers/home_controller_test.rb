require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get /home' do
    user = create(:user)
    sign_in user
    get home_url
    assert_response :success
  end
end
