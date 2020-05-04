require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  context "a authenticated user" do
    setup do
      sign_in create(:user)
      @submission = create(:submission)
      @exercice = create(:exercice)
    end

    should 'get index' do
      get submissions_url
      assert_response :success
    end

    should 'create submission' do
      assert_difference('Submission.count') do
        post submissions_url, params: { submission: { code: @submission.code, exercice_id: @submission.exercice_id, language_id: @submission.language_id, user_id: @submission.user_id } }
      end

      assert_redirected_to submission_url(Submission.last)
    end

    should 'show submission' do
      get submission_url(@exercice)
      assert_response :success
    end
  end

  context "a unauthenticated user" do
    setup do
      @submission = create(:submission)
      @exercice = create(:exercice)
    end

    should 'not get index' do
      get submissions_url
      assert_response :redirect
    end

    should 'not create submission' do
      assert_no_difference('Submission.count') do
        post submissions_url, params: { submission: { code: @submission.code, exercice_id: @submission.exercice_id, language_id: @submission.language_id, user_id: @submission.user_id } }
      end

      assert_response :redirect
    end

    should 'not show submission' do
      get submission_url(@exercice)
      assert_response :redirect
    end
  end
end
