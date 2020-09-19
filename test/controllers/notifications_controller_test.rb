# frozen_string_literal: true

require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  context "an authenticated user" do
    setup do
      sign_in create(:user)
    end

    should "get index" do
      get notifications_url
      assert_response :success
    end
  end

  context "an unauthenticated user" do
    should "not get notifications" do
      get notifications_url
      assert_response :redirect
    end
  end
end
