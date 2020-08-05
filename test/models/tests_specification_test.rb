require 'test_helper'

class TestsSpecificationTest < ActiveSupport::TestCase
  setup do
    @tests_specification = build :tests_specification
  end

  # limit_time validations

  test 'invalid without limit_time' do
    @tests_specification.limit_time = nil
    @tests_specification.valid?
    refute_empty @tests_specification.errors[:limit_time]
  end

  test 'valid if limit_time is 0.1' do
    @tests_specification.limit_time = 0.1
    @tests_specification.valid?
    assert_empty @tests_specification.errors[:limit_time]
  end

  test 'valid if limit_time is 5' do
    @tests_specification.limit_time = 5
    @tests_specification.valid?
    assert_empty @tests_specification.errors[:limit_time]
  end

  test 'invalid if limit_time is equals to 0' do
    @tests_specification.limit_time = 0
    @tests_specification.valid?
    refute_empty @tests_specification.errors[:limit_time]
  end

  test 'invalid if limit_time is less than 0' do
    @tests_specification.limit_time = -1
    @tests_specification.valid?
    refute_empty @tests_specification.errors[:limit_time]
  end

  test 'invalid if limit_time is greater than 5' do
    @tests_specification.limit_time = 6
    @tests_specification.valid?
    refute_empty @tests_specification.errors[:limit_time]
  end

  # limit_mem validations

  test 'invalid without limit_mem' do
    @tests_specification.limit_mem = nil
    @tests_specification.valid?
    refute_empty @tests_specification.errors[:limit_mem]
  end

  test 'valid if limit_mem is equals to 10' do
    @tests_specification.limit_mem = 10
    @tests_specification.valid?
    assert_empty @tests_specification.errors[:limit_mem]
  end

  test 'valid if limit_mem is equals to 250' do
    @tests_specification.limit_mem = 250
    @tests_specification.valid?
    assert_empty @tests_specification.errors[:limit_mem]
  end

  test 'invalid if limit_mem is equals to 0' do
    @tests_specification.limit_mem = 0
    @tests_specification.valid?
    refute_empty @tests_specification.errors[:limit_mem]
  end

  test 'invalid if limit_mem is less than 10' do
    @tests_specification.limit_mem = 9
    @tests_specification.valid?
    refute_empty @tests_specification.errors[:limit_mem]
  end

  test 'invalid if limit_mem is greater than 250' do
    @tests_specification.limit_mem = 251
    @tests_specification.valid?
    refute_empty @tests_specification.errors[:limit_mem]
  end

  # code validations

  test 'invalid without code' do
    @tests_specification.code = nil
    @tests_specification.valid?
    refute_empty @tests_specification.errors[:code]
  end
  
  test 'valid with code' do
    @tests_specification.code = 'my code'
    @tests_specification.valid?
    assert_empty @tests_specification.errors[:code]
  end
  
  # tests validations

  test 'invalid if dont have a visible test' do
    @tests_specification.tests = []
    @tests_specification.tests << build(:test, visible: false)
    @tests_specification.valid?
    refute_empty @tests_specification.errors[:tests]
  end

  test 'invalid if dont have a hidden test' do
    @tests_specification.tests = []
    @tests_specification.tests << build(:test, visible: true)
    @tests_specification.valid?
    refute_empty @tests_specification.errors[:tests]
  end
  
  test 'valid with a hidden and visible test' do
    @tests_specification.tests = []
    @tests_specification.tests << build(:test, visible: true)
    @tests_specification.tests << build(:test, visible: false)
    @tests_specification.valid?
    assert_empty @tests_specification.errors[:tests]
  end
end
