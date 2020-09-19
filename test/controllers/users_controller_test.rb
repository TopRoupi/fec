# frozen_string_literal: true

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "an authenticated user should show user" do
    sign_in create(:user)
    get user_path(@user)
    assert_response :success
  end

  test "a unauthenticated user should show user" do
    get user_path(@user)
    assert_response :success
  end
end
