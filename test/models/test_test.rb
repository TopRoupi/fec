require 'test_helper'

class TestTest < ActiveSupport::TestCase
  setup do
    @test = build(:test)
  end

  # input validations

  test 'invalid without input' do
    @test.input = nil
    @test.valid?
    refute_empty @test.errors[:input]
  end

  # output validations

  test 'invalid without output' do
    @test.output = nil
    @test.valid?
    refute_empty @test.errors[:output]
  end
end
