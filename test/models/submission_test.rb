# frozen_string_literal: true

require "test_helper"

class SubmissionTest < ActiveSupport::TestCase
  setup do
    VCR.use_cassette("submission") do
      @submission = build(:submission)
    end
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

  # exercice validations
  test "invalid without exercice" do
    @submission.exercice = nil
    @submission.valid?
    refute_empty @submission.errors[:exercice]
  end

  # methods tests

  test "set_result method should set result to true if all tests_results are correct" do
    VCR.use_cassette("submissions") do
      @submission.set_result

      assert @submission.correct?
    end
  end

  test "set_result method should set result to incorrect if it have any tests_results incorrect" do
    VCR.use_cassette("submissions") do
      @submission = create :wrong_submission
      @submission.set_result

      assert @submission.incorrect?
    end
  end
end
