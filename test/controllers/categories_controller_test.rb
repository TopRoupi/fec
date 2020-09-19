# frozen_string_literal: true

require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  context "an authenticated admin" do
    setup do
      sign_in create(:admin)
      @category = create(:category)
    end

    should "get index" do
      get categories_url
      assert_response :success
    end

    should "get new" do
      get new_category_url
      assert_response :success
    end

    should "create category" do
      assert_difference("Category.count") do
        post categories_url, params: {category: {name: @category.name}}
      end

      assert_redirected_to category_url(Category.last)
    end

    should "show category" do
      get category_url(@category)
      assert_response :success
    end

    should "get edit" do
      get edit_category_url(@category)
      assert_response :success
    end

    should "update category" do
      patch category_url(@category), params: {category: {name: @category.name}}
      assert_redirected_to category_url(@category)
    end

    should "destroy category" do
      assert_difference("Category.count", -1) do
        delete category_url(@category)
      end

      assert_redirected_to categories_url
    end
  end

  context "a unauthenticated user" do
    setup do
      @category = create(:category)
    end

    should "get index" do
      get categories_url
      assert_response :success
    end

    should "not get new" do
      get new_category_url
      assert_response :redirect
    end

    should "not create category" do
      assert_no_difference("Category.count") do
        post categories_url, params: {category: {name: @category.name}}
      end

      assert_response :redirect
    end

    should "show category" do
      get category_url(@category)
      assert_response :success
    end

    should "not get edit" do
      get edit_category_url(@category)
      assert_response :redirect
    end

    should "not update category" do
      updated_name = "veeeetoreeeeees"
      patch category_url(@category), params: {category: {name: updated_name}}
      @category.reload
      refute_equal(updated_name, @category.name)
    end

    should "not destroy category" do
      assert_no_difference("Category.count", -1) do
        delete category_url(@category)
      end

      assert_response :redirect
    end
  end
end
