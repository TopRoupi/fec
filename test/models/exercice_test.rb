# frozen_string_literal: true

require "test_helper"

class ExerciceTest < ActiveSupport::TestCase
  setup do
    @exercice = build(:exercice)
  end

  test "create a test specification after create a new exercice" do
    exercice = create :exercice, tests_specification: nil
    refute_nil exercice.tests_specification
  end

  # name validations

  test "invalid without a name" do
    @exercice.name = nil
    @exercice.valid?
    refute_empty @exercice.errors[:name]
  end

  test "valid if name have 30 or less characters" do
    @exercice.name = "0" * 30
    @exercice.valid?
    assert_empty @exercice.errors[:name]
  end

  test "invalid if name have more than 30 characters" do
    @exercice.name = "0" * 31
    @exercice.valid?
    refute_empty @exercice.errors[:name]
  end

  # level validations

  test "invalid without level" do
    @exercice.level = nil
    @exercice.valid?
    refute_empty @exercice.errors[:level]
  end

  test "valid if level is between 0 and 5" do
    (1..5).each do |i|
      @exercice.level = i
      @exercice.valid?
      assert_empty @exercice.errors[:level]
    end
  end

  test "invalid if level is greater than 5" do
    @exercice.level = 6
    @exercice.valid?
    refute_empty @exercice.errors[:level]
  end

  test "invalid if level is less than 0" do
    @exercice.level = -1
    @exercice.valid?
    refute_empty @exercice.errors[:level]
  end

  # content validatins

  test "invalid without content" do
    @exercice.content = nil
    @exercice.valid?
    refute_empty @exercice.errors[:content]
  end

  test "#submissions_by_unique_users" do
    VCR.use_cassette("submissions") do
      user_a = create :user
      user_b = create :user

      create :submission, exercice: @exercice, user: user_a
      create :submission, exercice: @exercice, user: user_a

      create :submission, exercice: @exercice, user: user_b

      assert @exercice.submissions_by_unique_users.length, 2
      assert_includes @exercice.submissions_by_unique_users, user_a.submissions
      assert_includes @exercice.submissions_by_unique_users, user_b.submissions
    end
  end

  test "#users_with_correct_submissions should return users with at least one correct submission" do
    VCR.use_cassette("submissions") do
      user_a = create :user
      user_b = create :user

      create :submission, user: user_a, exercice: @exercice
      create :submission, user: user_a, exercice: @exercice
      create :wrong_submission, user: user_a, exercice: @exercice

      create :wrong_submission, user: user_b, exercice: @exercice

      assert_includes @exercice.users_with_correct_submissions, user_a
      refute_includes @exercice.users_with_correct_submissions, user_b
      assert_equal 1, @exercice.users_with_correct_submissions.length
    end
  end

  test "#users_without_correct_submissions should return users without a correct submission" do
    VCR.use_cassette("submissions") do
      user_a = create :user
      user_b = create :user

      create :submission, user: user_a, exercice: @exercice
      create :wrong_submission, user: user_a, exercice: @exercice

      create :wrong_submission, user: user_b, exercice: @exercice
      create :wrong_submission, user: user_b, exercice: @exercice

      refute_includes @exercice.users_without_correct_submissions, user_a
      assert_includes @exercice.users_without_correct_submissions, user_b
      assert_equal 1, @exercice.users_without_correct_submissions.length
    end
  end

  test "#correct_submissions_percentage should return the percentage of users that solved the exercice" do
    VCR.use_cassette("submissions") do
      user_a = create :user
      user_b = create :user

      create :submission, user: user_a, exercice: @exercice
      create :wrong_submission, user: user_a, exercice: @exercice

      create :wrong_submission, user: user_b, exercice: @exercice
      create :wrong_submission, user: user_b, exercice: @exercice

      assert @exercice.correct_submissions_percentage, 50.0
    end
  end

  test "#correct_submissions_percentage should be 0 without submissions" do
    assert @exercice.correct_submissions_percentage, 0
  end

  test "#excerpt should return the first paragraph of the content" do
    @exercice.content = "some text\n"\
                        "some other text"

    assert_equal @exercice.excerpt, "some text"
  end
end
