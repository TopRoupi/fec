# frozen_string_literal: true

require "application_system_test_case"

class TestsSpecificationsTest < ApplicationSystemTestCase
  setup do
    @tests_specification = tests_specifications(:one)
  end

  test "visiting the index" do
    visit tests_specifications_url
    assert_selector "h1", text: "Tests Specifications"
  end

  test "creating a Tests specification" do
    visit tests_specifications_url
    click_on "New Tests Specification"

    fill_in "Code", with: @tests_specification.code
    fill_in "Exercice", with: @tests_specification.exercice_id
    fill_in "Limit mem", with: @tests_specification.limit_mem
    fill_in "Limit time", with: @tests_specification.limit_time
    click_on "Create Tests specification"

    assert_text "Tests specification was successfully created"
    click_on "Back"
  end

  test "updating a Tests specification" do
    visit tests_specifications_url
    click_on "Edit", match: :first

    fill_in "Code", with: @tests_specification.code
    fill_in "Exercice", with: @tests_specification.exercice_id
    fill_in "Limit mem", with: @tests_specification.limit_mem
    fill_in "Limit time", with: @tests_specification.limit_time
    click_on "Update Tests specification"

    assert_text "Tests specification was successfully updated"
    click_on "Back"
  end

  test "destroying a Tests specification" do
    visit tests_specifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tests specification was successfully destroyed"
  end
end
