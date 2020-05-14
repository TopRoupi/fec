require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  setup do
    @submission = build(:submission)
  end

  # code validations
  test 'invalid without code' do
    @submission.code = nil
    @submission.valid?
    refute_empty @submission.errors[:code]
  end

  test 'invalid with a empty code' do
    @submission.code = ""
    @submission.valid?
    refute_empty @submission.errors[:code]
  end

  # user validations
  test 'invalid without user' do
    @submission.user = nil
    @submission.valid?
    refute_empty @submission.errors[:user]
  end

  # language validations
  test 'invalid without language' do
    @submission.language = nil
    @submission.valid?
    refute_empty @submission.errors[:language]
  end

  # exercice validations
  test 'invalid without exercice' do
    @submission.exercice = nil
    @submission.valid?
    refute_empty @submission.errors[:exercice]
  end

  # methods tests

  test 'passed? method should return true if all submission tests passed' do
    test1 = create(:submissions_test, submission: @submission)
    test2 = create(:submissions_test, submission: @submission)

    assert @submission.passed?
  end

  test 'passed? method should return false if any submission test failed' do
    test1 = create(:submissions_test, submission: @submission)
    test2 = create(:submissions_test, submission: @submission, pass: false)

    refute @submission.passed?
  end
end
