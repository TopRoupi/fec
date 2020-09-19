# frozen_string_literal: true

require "application_system_test_case"

class ExercicesTest < ApplicationSystemTestCase
  setup do
    @exercice = exercices(:one)
  end

  test "visiting the index" do
    visit exercices_url
    assert_selector "h1", text: "Exercices"
  end

  test "creating a Exercice" do
    visit exercices_url
    click_on "New Exercice"

    fill_in "Category", with: @exercice.category_id
    fill_in "Code", with: @exercice.code
    fill_in "Content", with: @exercice.content
    fill_in "Language", with: @exercice.language_id
    fill_in "Level", with: @exercice.level
    fill_in "Limit mem", with: @exercice.limit_mem
    fill_in "Limit time", with: @exercice.limit_time
    fill_in "Name", with: @exercice.name
    click_on "Create Exercice"

    assert_text "Exercice was successfully created"
    click_on "Back"
  end

  test "updating a Exercice" do
    visit exercices_url
    click_on "Edit", match: :first

    fill_in "Category", with: @exercice.category_id
    fill_in "Code", with: @exercice.code
    fill_in "Content", with: @exercice.content
    fill_in "Language", with: @exercice.language_id
    fill_in "Level", with: @exercice.level
    fill_in "Limit mem", with: @exercice.limit_mem
    fill_in "Limit time", with: @exercice.limit_time
    fill_in "Name", with: @exercice.name
    click_on "Update Exercice"

    assert_text "Exercice was successfully updated"
    click_on "Back"
  end

  test "destroying a Exercice" do
    visit exercices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exercice was successfully destroyed"
  end
end
