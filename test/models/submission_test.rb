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
end
