# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = build(:user)
  end

  # name validations

  test "invalid without a name" do
    @user.name = nil
    @user.valid?
    refute_empty @user.errors[:name]
  end

  test "valid if name have 60 or less characters" do
    @user.name = "0" * 60
    @user.valid?
    assert_empty @user.errors[:name]
  end

  test "invalid if name have more than 60 characters" do
    @user.name = "0" * 61
    @user.valid?
    refute_empty @user.errors[:name]
  end

  # password validations

  test "invalid without a password" do
    @user.password = nil
    @user.valid?
    refute_empty @user.errors[:password]
  end

  test "invalid if password have less than 6 characters" do
    @user.password = "0" * 5
    @user.valid?
    refute_empty @user.errors[:password]
  end

  test "invalid if password have more than 50 characters" do
    @user.password = "0" * 51
    @user.valid?
    refute_empty @user.errors[:password]
  end

  test "valid if password have 8 characters" do
    @user.password = "0" * 8
    @user.valid?
    assert_empty @user.errors[:password]
  end

  test "valid if password equals to 50 characters" do
    @user.password = "0" * 50
    @user.valid?
    assert_empty @user.errors[:password]
  end

  # email validations

  test "invalid without a email" do
    @user.email = nil
    @user.valid?
    refute_empty @user.errors[:email]
  end

  test "invalid with a invalid email" do
    @user.email = "email.com"
    @user.valid?
    refute_empty @user.errors[:email]
  end

  test "#have_correct_submission_in? should be true with a correct submission" do
    submission = create :submission, user: @user
    submission.process_tests!
    submission.set_result

    assert @user.have_correct_submission_in?(submission.exercise)
  end

  test "#have_correct_submission_in? should be false without a correct submission" do
    submission = create :wrong_submission, user: @user

    refute @user.have_correct_submission_in?(submission.exercise)
  end

  test "#have_on_do_later_list? should be true if the exercise is on do later list" do
    exercise = create :exercise
    @user.do_later_list.exercises << exercise
    @user.save!

    assert @user.have_on_do_later_list?(exercise)
  end

  test "#have_on_do_later_list? should be false if the exercise is not on do later list" do
    exercise = create :exercise

    refute @user.have_on_do_later_list? exercise
  end

  test "#exercises_history should return every exercise that this user have a submission in" do
    exercise1 = create :exercise
    exercise2 = create :exercise

    create :submission, exercise: exercise1, user: @user
    create :submission, exercise: exercise2, user: @user

    assert_includes @user.exercises_history, exercise1
    assert_includes @user.exercises_history, exercise2
  end

  test "#exercises_history should order by submission creation" do
    exercise1 = create :exercise
    exercise2 = create :exercise

    create :submission, exercise: exercise1, user: @user
    create :submission, exercise: exercise2, user: @user
    create :submission, exercise: exercise1, user: @user

    assert_equal @user.exercises_history.first, exercise1
    assert_equal @user.exercises_history.second, exercise2
  end

  test "#exercise_history should limit returned results by a param" do
    exercise1 = create :exercise
    exercise2 = create :exercise

    create :submission, exercise: exercise1, user: @user
    create :submission, exercise: exercise2, user: @user

    assert_equal @user.exercises_history(1).length, 1
  end

  test "#lists should not list the user's do later list" do
    list = create :list
    @user.lists << list
    @user.save
    @user.reload

    refute_includes @user.lists, @user.do_later_list
  end

  test "#all_lists should return all user's lists plus do_later_list" do
    list = create :list
    @user.lists << list
    @user.save
    @user.reload

    assert_includes @user.all_lists, @user.do_later_list
  end

  test "#solved_exercises should return solved exercises" do
    correct_exercise = create :exercise

    create :submission, user: @user, exercise: correct_exercise, result: :correct

    assert_includes @user.solved_exercises, correct_exercise
  end

  test "#solved_exercises should not return unsolved exercises" do
    wrong_exercise = create :exercise

    create :wrong_submission, user: @user, exercise: wrong_exercise, result: :incorrect

    refute_includes @user.solved_exercises, wrong_exercise
  end
end
