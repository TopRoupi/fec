# frozen_string_literal: true

require "test_helper"

class ListTest < ActiveSupport::TestCase
  setup do
    @list = build(:list)
  end

  # name validations

  test "invalid without a name" do
    @list.name = nil
    @list.valid?
    refute_empty @list.errors[:name]
  end

  test "valid if name have 60 or less characters" do
    @list.name = "0" * 60
    @list.valid?
    assert_empty @list.errors[:name]
  end

  test "invalid if name have more than 60 characters" do
    @list.name = "0" * 61
    @list.valid?
    refute_empty @list.errors[:name]
  end

  # description validations

  test "valid without a description" do
    @list.description = nil
    @list.valid?
    assert_empty @list.errors[:description]
  end

  test "invalid if description have more then 255 characters" do
    @list.description = "a" * 256
    @list.valid?
    refute_empty @list.errors[:description]
  end

  # privacy validations

  test "should add private_list privacy after initiate a List instance" do
    list = List.new
    assert_equal list.privacy, "private_list"
  end

  test "invalid without a privacy" do
    @list.privacy = nil
    @list.valid?
    refute_empty @list.errors[:privacy]
  end
end
