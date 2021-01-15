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

    assert @user.have_correct_submission_in?(submission.exercice)
  end

  test "#have_correct_submission_in? should be false without a correct submission" do
    submission = create :wrong_submission, user: @user

    refute @user.have_correct_submission_in?(submission.exercice)
  end

  test "#have_on_do_later_list? should be true if the exercice is on do later list" do
    exercice = create :exercice
    @user.do_later_list.exercices << exercice
    @user.save!

    assert @user.have_on_do_later_list?(exercice)
  end

  test "#have_on_do_later_list? should be false if the exercice is not on do later list" do
    exercice = create :exercice

    refute @user.have_on_do_later_list? exercice
  end

  test "#exercices_history should return every exercice that this user have a submission in" do
    exercice1 = create :exercice
    exercice2 = create :exercice

    create :submission, exercice: exercice1, user: @user
    create :submission, exercice: exercice2, user: @user

    assert_includes @user.exercices_history, exercice1
    assert_includes @user.exercices_history, exercice2
  end

  test "#exercices_history should order by submission creation" do
    exercice1 = create :exercice
    exercice2 = create :exercice

    create :submission, exercice: exercice1, user: @user
    create :submission, exercice: exercice2, user: @user
    create :submission, exercice: exercice1, user: @user

    assert_equal @user.exercices_history.first, exercice1
    assert_equal @user.exercices_history.second, exercice2
  end
end
