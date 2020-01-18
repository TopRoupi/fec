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

  # exercice validations

  test 'valid with a valid exercice' do
    exercice = build :exercice
    exercice.tests << @test
    @test.valid?
    assert_empty @test.errors[:exercice]
  end

  test 'invalid with a invalid exercice' do
    exercice = build :exercice, name: nil
    exercice.tests << @test
    @test.valid?
    refute_empty @test.errors[:exercice]
  end
end
