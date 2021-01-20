# frozen_string_literal: true

require "test_helper"

class SubmissionTest < ActiveSupport::TestCase
  setup do
    @submission = build(:submission)
  end

  # code validations
  test "invalid without code" do
    @submission.code = nil
    @submission.valid?
    refute_empty @submission.errors[:code]
  end

  test "invalid with a empty code" do
    @submission.code = ""
    @submission.valid?
    refute_empty @submission.errors[:code]
  end

  # user validations
  test "invalid without user" do
    @submission.user = nil
    @submission.valid?
    refute_empty @submission.errors[:user]
  end

  # language validations
  test "invalid without language" do
    @submission.language = nil
    @submission.valid?
    refute_empty @submission.errors[:language]
  end

  # exercise validations
  test "invalid without exercise" do
    @submission.exercise = nil
    @submission.valid?
    refute_empty @submission.errors[:exercise]
  end

  # methods tests

  test "#set_result should set result to true if all tests_results are correct" do
    @submission.save!
    @submission.process_tests!
    @submission.set_result

    assert @submission.correct?
  end

  test "#set_result should set result to incorrect if it have any tests_results incorrect" do
    @submission = create :wrong_submission
    @submission.process_tests!
    @submission.set_result

    assert @submission.incorrect?
  end

  test "#set_result should set result to nil if it have any test_results unprocessed" do
    @submission.save!
    @submission.set_result

    assert_nil @submission.result
  end

  test "#set_result should set result to nil if it have any test_results processing" do
    @submission.save!
    @submission.tests_results.last.update(process_state: :processing)
    @submission.set_result

    assert_nil @submission.result
  end
end
