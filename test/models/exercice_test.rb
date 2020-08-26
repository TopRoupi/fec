require 'test_helper'

class ExerciceTest < ActiveSupport::TestCase
  setup do
    @exercice = build(:exercice)
  end
  
  test 'create a test specification after create a new exercice' do
    exercice = create :exercice, tests_specification: nil
    refute_nil exercice.tests_specification
  end

  # name validations

  test 'invalid without a name' do
    @exercice.name = nil
    @exercice.valid?
    refute_empty @exercice.errors[:name]
  end

  test 'valid if name have 30 or less characters' do
    @exercice.name = '0' * 30
    @exercice.valid?
    assert_empty @exercice.errors[:name]
  end

  test 'invalid if name have more than 30 characters' do
    @exercice.name = '0' * 31
    @exercice.valid?
    refute_empty @exercice.errors[:name]
  end

  # level validations

  test 'invalid without level' do
    @exercice.level = nil
    @exercice.valid?
    refute_empty @exercice.errors[:level]
  end
  
  test 'valid if level is between 0 and 5' do
    for i in 1..5
      @exercice.level = i
      @exercice.valid?
      assert_empty @exercice.errors[:level]
    end
  end

  test 'invalid if level is greater than 5' do
    @exercice.level = 6
    @exercice.valid?
    refute_empty @exercice.errors[:level]
  end

  test 'invalid if level is less than 0' do
    @exercice.level = -1
    @exercice.valid?
    refute_empty @exercice.errors[:level]
  end

  # content validatins

  test 'invalid without content' do
    @exercice.content = nil
    @exercice.valid?
    refute_empty @exercice.errors[:content]
  end

  test '#submissions_by_unique_users' do
    user_a = create :user
    user_b = create :user

    create :submission, exercice: @exercice, user: user_a
    create :submission, exercice: @exercice, user: user_a

    create :submission, exercice: @exercice, user: user_b

    assert @exercice.submissions_by_unique_users.length, 2
    assert_includes @exercice.submissions_by_unique_users, user_a.submissions
    assert_includes @exercice.submissions_by_unique_users, user_b.submissions
  end

  test '#submissions should return exercice submissions' do
    sub_a = create :submission, exercice: @exercice
    sub_b = create :submission, exercice: @exercice

    assert_includes @exercice.submissions, sub_a
    assert_includes @exercice.submissions, sub_b
  end

  test "#users should return users that submitted in this exercice" do
    sub_a = create :submission, exercice: @exercice
    sub_b = create :submission

    assert_includes @exercice.users, sub_a.user
    refute_includes @exercice.users, sub_b.user
  end

  test "#users_with_correct_submissions" do
    sub_a = create :submission, exercice: @exercice
    sub_b = create :wrong_submission, exercice: @exercice

    assert_includes @exercice.users_with_correct_submissions, sub_a.user
    refute_includes @exercice.users_with_correct_submissions, sub_b.user
  end

  test "#users_without_correct_submissions" do
    sub_a = create :submission, exercice: @exercice
    sub_b = create :wrong_submission, exercice: @exercice

    refute_includes @exercice.users_without_correct_submissions, sub_a.user
    assert_includes @exercice.users_without_correct_submissions, sub_b.user
  end

  test "#correct_submissions_percentage" do
    sub_a = create :submission, exercice: @exercice
    sub_b = create :wrong_submission, exercice: @exercice

    assert @exercice.correct_submissions_percentage, 50.0
  end

  test "#correct_submissions_percentage should be 0 without submissions" do
    assert @exercice.correct_submissions_percentage, 0
  end
end
