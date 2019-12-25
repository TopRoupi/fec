require "application_system_test_case"

class SubmissionsTestsTest < ApplicationSystemTestCase
  setup do
    @submissions_test = submissions_tests(:one)
  end

  test "visiting the index" do
    visit submissions_tests_url
    assert_selector "h1", text: "Submissions Tests"
  end

  test "creating a Submissions test" do
    visit submissions_tests_url
    click_on "New Submissions Test"

    fill_in "Errors", with: @submissions_test.errors
    fill_in "Mem peak", with: @submissions_test.mem_peak
    fill_in "Output", with: @submissions_test.output
    check "Pass" if @submissions_test.pass
    fill_in "Submission", with: @submissions_test.submission_id
    fill_in "Test", with: @submissions_test.test_id
    fill_in "Time running", with: @submissions_test.time_running
    fill_in "Warnings", with: @submissions_test.warnings
    click_on "Create Submissions test"

    assert_text "Submissions test was successfully created"
    click_on "Back"
  end

  test "updating a Submissions test" do
    visit submissions_tests_url
    click_on "Edit", match: :first

    fill_in "Errors", with: @submissions_test.errors
    fill_in "Mem peak", with: @submissions_test.mem_peak
    fill_in "Output", with: @submissions_test.output
    check "Pass" if @submissions_test.pass
    fill_in "Submission", with: @submissions_test.submission_id
    fill_in "Test", with: @submissions_test.test_id
    fill_in "Time running", with: @submissions_test.time_running
    fill_in "Warnings", with: @submissions_test.warnings
    click_on "Update Submissions test"

    assert_text "Submissions test was successfully updated"
    click_on "Back"
  end

  test "destroying a Submissions test" do
    visit submissions_tests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Submissions test was successfully destroyed"
  end
end
