# frozen_string_literal: true

require "test_helper"

class TestTest < ActiveSupport::TestCase
  setup do
    @test = build(:test)
  end

  # input validations

  test "valid with input" do
    @test.input = '1\n2'
    @test.valid?
    assert_empty @test.errors[:input]
  end

  test "invalid without input" do
    @test.input = nil
    @test.valid?
    refute_empty @test.errors[:input]
  end

  # output validations

  test "valid with output" do
    @test.output = "X = 3"
    @test.valid?
    assert_empty @test.errors[:output]
  end

  test "invalid without output" do
    @test.output = nil
    @test.valid?
    refute_empty @test.errors[:output]
  end

  # exercice validations

  test "valid with a valid test specification" do
    tests_specification = build :tests_specification
    tests_specification.tests << @test
    @test.valid?
    assert_empty @test.errors[:tests_specification]
  end

  test "invalid with a invalid test specification" do
    tests_specification = build :tests_specification, code: nil
    tests_specification.tests << @test
    @test.valid?
    refute_empty @test.errors[:tests_specification]
  end
end
