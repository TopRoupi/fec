# frozen_string_literal: true

require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "an authenticated user should get index" do
    sign_in create(:user)
    get home_url
    assert_response :success
  end

  test "a unauthenticated user should get index" do
    get home_url
    assert_response :success
  end
end
