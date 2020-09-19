# frozen_string_literal: true

require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = build(:category)
  end

  # name validations

  test "invalid without a name" do
    @category.name = nil
    @category.valid?
    refute_empty @category.errors[:name]
  end

  test "valid if name have 30 or less characters" do
    @category.name = "0" * 30
    @category.valid?
    assert_empty @category.errors[:name]
  end

  test "invalid if name have more than 30 characters" do
    @category.name = "0" * 31
    @category.valid?
    refute_empty @category.errors[:name]
  end
end
