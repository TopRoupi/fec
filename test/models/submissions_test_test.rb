# frozen_string_literal: true

require "test_helper"

class SubmissionsTestTest < ActiveSupport::TestCase
  setup do
    VCR.use_cassette("submissions") do
      @submissions_test = build(:submissions_test)
    end
  end

  # description validations

  test "invalid without description" do
    @submissions_test.description = nil
    @submissions_test.valid?
    refute_empty @submissions_test.errors[:description]
  end
end
