# frozen_string_literal: true

require "test_helper"

class LanguagesControllerTest < ActionDispatch::IntegrationTest
  context "an authenticated administrator" do
    setup do
      sign_in create(:admin)
      @language = create(:language)
    end

    should "get index" do
      get languages_url
      assert_response :success
    end

    should "get new" do
      get new_language_url
      assert_response :success
    end

    should "create language" do
      assert_difference("Language.count") do
        post languages_url, params: {language: {cod: @language.cod, name: @language.name}}
      end

      assert_redirected_to language_url(Language.last)
    end

    should "show language" do
      get language_url(@language)
      assert_response :success
    end

    should "get edit" do
      get edit_language_url(@language)
      assert_response :success
    end

    should "update language" do
      patch language_url(@language), params: {language: {cod: @language.cod, name: @language.name}}
      assert_redirected_to language_url(@language)
    end

    should "destroy language" do
      assert_difference("Language.count", -1) do
        delete language_url(@language)
      end

      assert_redirected_to languages_url
    end
  end

  context "a unauthenticated user" do
    setup do
      @language = create(:language)
    end

    should "not get index" do
      get languages_url
      assert_response :redirect
    end

    should "not get new" do
      get new_language_url
      assert_response :redirect
    end

    should "not create language" do
      assert_no_difference("Language.count") do
        post languages_url, params: {language: {cod: @language.cod, name: @language.name}}
      end
    end

    should "not show language" do
      get language_url(@language)
      assert_response :redirect
    end

    should "not get edit" do
      get edit_language_url(@language)
      assert_response :redirect
    end

    should "not update language" do
      updated_name = "paiton"
      patch language_url(@language), params: {language: {cod: @language.cod, name: updated_name}}
      @language.reload
      refute_equal(updated_name, @language.name)
    end

    should "not destroy language" do
      assert_no_difference("Language.count") do
        delete language_url(@language)
      end
    end
  end
end
