require 'test_helper'

class SubmissionsTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submissions_test = submissions_tests(:one)
  end

  test "should get index" do
    get submissions_tests_url
    assert_response :success
  end

  test "should get new" do
    get new_submissions_test_url
    assert_response :success
  end

  test "should create submissions_test" do
    assert_difference('SubmissionsTest.count') do
      post submissions_tests_url, params: { submissions_test: { errors: @submissions_test.errors, mem_peak: @submissions_test.mem_peak, output: @submissions_test.output, pass: @submissions_test.pass, submission_id: @submissions_test.submission_id, test_id: @submissions_test.test_id, time_running: @submissions_test.time_running, warnings: @submissions_test.warnings } }
    end

    assert_redirected_to submissions_test_url(SubmissionsTest.last)
  end

  test "should show submissions_test" do
    get submissions_test_url(@submissions_test)
    assert_response :success
  end

  test "should get edit" do
    get edit_submissions_test_url(@submissions_test)
    assert_response :success
  end

  test "should update submissions_test" do
    patch submissions_test_url(@submissions_test), params: { submissions_test: { errors: @submissions_test.errors, mem_peak: @submissions_test.mem_peak, output: @submissions_test.output, pass: @submissions_test.pass, submission_id: @submissions_test.submission_id, test_id: @submissions_test.test_id, time_running: @submissions_test.time_running, warnings: @submissions_test.warnings } }
    assert_redirected_to submissions_test_url(@submissions_test)
  end

  test "should destroy submissions_test" do
    assert_difference('SubmissionsTest.count', -1) do
      delete submissions_test_url(@submissions_test)
    end

    assert_redirected_to submissions_tests_url
  end
end
