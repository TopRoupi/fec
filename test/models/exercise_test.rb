# frozen_string_literal: true

require "test_helper"

class ExerciseTest < ActiveSupport::TestCase
  setup do
    @exercise = build(:exercise)
  end

  test "create a test specification after create a new exercise" do
    exercise = create :exercise, tests_specification: nil
    refute_nil exercise.tests_specification
  end

  # name validations

  test "invalid without a name" do
    @exercise.name = nil
    @exercise.valid?
    refute_empty @exercise.errors[:name]
  end

  test "valid if name have 30 or less characters" do
    @exercise.name = "0" * 30
    @exercise.valid?
    assert_empty @exercise.errors[:name]
  end

  test "invalid if name have more than 30 characters" do
    @exercise.name = "0" * 31
    @exercise.valid?
    refute_empty @exercise.errors[:name]
  end

  # level validations

  test "invalid without level" do
    @exercise.level = nil
    @exercise.valid?
    refute_empty @exercise.errors[:level]
  end

  test "valid if level is between 0 and 5" do
    (1..5).each do |i|
      @exercise.level = i
      @exercise.valid?
      assert_empty @exercise.errors[:level]
    end
  end

  test "invalid if level is greater than 5" do
    @exercise.level = 6
    @exercise.valid?
    refute_empty @exercise.errors[:level]
  end

  test "invalid if level is less than 0" do
    @exercise.level = -1
    @exercise.valid?
    refute_empty @exercise.errors[:level]
  end

  # content validatins

  test "invalid without content" do
    @exercise.content = nil
    @exercise.valid?
    refute_empty @exercise.errors[:content]
  end

  test "#submissions_by_unique_users" do
    user_a = create :user
    user_b = create :user

    create :submission, exercise: @exercise, user: user_a
    create :submission, exercise: @exercise, user: user_a

    create :submission, exercise: @exercise, user: user_b

    assert @exercise.submissions_by_unique_users.length, 2
    assert_includes @exercise.submissions_by_unique_users, user_a.submissions
    assert_includes @exercise.submissions_by_unique_users, user_b.submissions
  end

  test "#users_with_correct_submissions should return users with at least one correct submission" do
    user_a = create :user
    user_b = create :user

    create(:submission, user: user_a, exercise: @exercise).process_tests!
    create(:wrong_submission, user: user_a, exercise: @exercise).process_tests!

    create(:wrong_submission, user: user_b, exercise: @exercise).process_tests!

    assert_includes @exercise.users_with_correct_submissions, user_a
    refute_includes @exercise.users_with_correct_submissions, user_b
    assert_equal 1, @exercise.users_with_correct_submissions.length
  end

  test "#users_without_correct_submissions should return users without a correct submission" do
    user_a = create :user
    user_b = create :user

    create(:submission, user: user_a, exercise: @exercise).process_tests!
    create(:wrong_submission, user: user_a, exercise: @exercise).process_tests!

    create(:wrong_submission, user: user_b, exercise: @exercise).process_tests!
    create(:wrong_submission, user: user_b, exercise: @exercise).process_tests!

    refute_includes @exercise.users_without_correct_submissions, user_a
    assert_includes @exercise.users_without_correct_submissions, user_b
    assert_equal 1, @exercise.users_without_correct_submissions.length
  end

  test "#correct_submissions_percentage should return the percentage of users that solved the exercise" do
    user_a = create :user
    user_b = create :user

    create(:submission, user: user_a, exercise: @exercise).process_tests!
    create(:wrong_submission, user: user_a, exercise: @exercise).process_tests!

    create(:wrong_submission, user: user_b, exercise: @exercise).process_tests!
    create(:wrong_submission, user: user_b, exercise: @exercise).process_tests!

    assert @exercise.correct_submissions_percentage, 50.0
  end

  test "#correct_submissions_percentage should be 0 without submissions" do
    assert @exercise.correct_submissions_percentage, 0
  end

  test "#excerpt should return the first paragraph of the content" do
    @exercise.content = "some text\n"\
      "some other text"

    assert_equal @exercise.excerpt, "some text"
  end
end
