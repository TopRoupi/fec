# frozen_string_literal: true

require "test_helper"

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  context "an authenticated admin" do
    setup do
      sign_in create(:admin)
      @exercise = create(:exercise)
    end

    should "get index" do
      get exercises_url
      assert_response :success
    end

    should "get new" do
      get new_exercise_url
      assert_response :success
    end

    should "create exercise" do
      assert_difference("Exercise.count") do
        post exercises_url, params: {
          exercise: {
            category_id: @exercise.category_id,
            content: @exercise.content,
            level: @exercise.level,
            name: @exercise.name
          }
        }
      end

      assert_redirected_to exercise_url(Exercise.last)
    end

    should "show exercise" do
      get exercise_url(@exercise)
      assert_response :success
    end

    should "get edit" do
      get edit_exercise_url(@exercise)
      assert_response :success
    end

    should "update exercise" do
      patch exercise_url(@exercise), params: {
        exercise: {
          category_id: @exercise.category_id,
          content: @exercise.content,
          level: @exercise.level,
          name: @exercise.name
        }
      }
      assert_redirected_to exercise_url(@exercise)
    end

    should "destroy exercise" do
      assert_difference("Exercise.count", -1) do
        delete exercise_url(@exercise)
      end

      assert_redirected_to exercises_url
    end
  end

  context "a unauthenticated user" do
    setup do
      @exercise = create(:exercise)
    end

    should "get index" do
      get exercises_url
      assert_response :success
    end

    should "not get new" do
      get new_exercise_url
      assert_response :redirect
    end

    should "not create exercise" do
      assert_no_difference("Exercise.count") do
        post exercises_url, params: {
          exercise: {
            category_id: @exercise.category_id,
            content: @exercise.content,
            level: @exercise.level,
            name: @exercise.name
          }
        }
      end

      assert_response :redirect
    end

    should "show exercise" do
      get exercise_url(@exercise)
      assert_response :success
    end

    should "not get edit" do
      get edit_exercise_url(@exercise)
      assert_response :redirect
    end

    should "not update exercise" do
      updated_name = "sooooooooooam"
      patch exercise_url(@exercise), params: {
        exercise: {
          category_id: @exercise.category_id,
          content: @exercise.content,
          level: @exercise.level,
          name: @exercise.name
        }
      }
      @exercise.reload
      refute_equal(@exercise.name, updated_name)
    end

    should "not destroy exercise" do
      assert_no_difference("Exercise.count", -1) do
        delete exercise_url(@exercise)
      end

      assert_response :redirect
    end
  end
end
