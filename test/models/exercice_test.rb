require 'test_helper'

class ExerciceTest < ActiveSupport::TestCase
  setup do
    @exercice = build(:exercice)
  end

  # name validations

  test 'invalid without a name' do
    @exercice.name = nil
    @exercice.valid?
    refute_empty @exercice.errors[:name]
  end

  test 'valid if name have 30 or less characters' do
    @exercice.name = '0' * 30
    @exercice.valid?
    assert_empty @exercice.errors[:name]
  end

  test 'invalid if name have more than 30 characters' do
    @exercice.name = '0' * 31
    @exercice.valid?
    refute_empty @exercice.errors[:name]
  end

  # level validations

  test 'invalid without level' do
    @exercice.level = nil
    @exercice.valid?
    refute_empty @exercice.errors[:level]
  end

  test 'invalid if level is greater than 5' do
    @exercice.level = 6
    @exercice.valid?
    refute_empty @exercice.errors[:level]
  end

  test 'invalid if level is less than 0' do
    @exercice.level = -1
    @exercice.valid?
    refute_empty @exercice.errors[:level]
  end

  test 'valid with a level less or equals to 5' do
    @exercice.level = 5
    @exercice.valid?
    assert_empty @exercice.errors[:level]
  end

  test 'valid with a level greater than 0' do
    @exercice.level = 1
    @exercice.valid?
    assert_empty @exercice.errors[:level]
  end

  # limit_time validations

  test 'invalid without limit_time' do
    @exercice.limit_time = nil
    @exercice.valid?
    refute_empty @exercice.errors[:limit_time]
  end

  test 'valid if limit_time is between 1 and 5' do
    (1..5).each do |i|
      @exercice.limit_time = i
      @exercice.valid?
      assert_empty @exercice.errors[:limit_time]
    end
  end

  test 'invalid if limit_time is equals to 0' do
    @exercice.limit_time = 0
    @exercice.valid?
    refute_empty @exercice.errors[:limit_time]
  end

  test 'invalid if limit_time is less than 0' do
    @exercice.limit_time = -1
    @exercice.valid?
    refute_empty @exercice.errors[:limit_time]
  end

  test 'invalid if limit_time is greater than 5' do
    @exercice.limit_time = 6
    @exercice.valid?
    refute_empty @exercice.errors[:limit_time]
  end

  # limit_mem validations

  test 'invalid without limit_mem' do
    @exercice.limit_mem = nil
    @exercice.valid?
    refute_empty @exercice.errors[:limit_mem]
  end

  test 'valid if limit_mem is less or equals to 1250' do
    @exercice.limit_mem = 1250
    @exercice.valid?
    assert_empty @exercice.errors[:limit_mem]
  end

  test 'invalid if limit_mem is equals to 0' do
    @exercice.limit_mem = 0
    @exercice.valid?
    refute_empty @exercice.errors[:limit_mem]
  end

  test 'invalid if limit_mem is less than 0' do
    @exercice.limit_mem = -1
    @exercice.valid?
    refute_empty @exercice.errors[:limit_mem]
  end

  test 'invalid if limit_mem is greater than 1250' do
    @exercice.limit_mem = 1251
    @exercice.valid?
    refute_empty @exercice.errors[:limit_mem]
  end

  # content validatins

  test 'invalid without content' do
    @exercice.content = nil
    @exercice.valid?
    refute_empty @exercice.errors[:content]
  end

  # code validations

  test 'invalid without code' do
    @exercice.code = nil
    @exercice.valid?
    refute_empty @exercice.errors[:code]
  end

  # tests validationd

  test 'invalid if dont have a visible test' do
    @exercice.tests = []
    @exercice.tests << build(:test, visible: false)
    @exercice.valid?
    refute_empty @exercice.errors[:tests]
  end

  test 'invalid if dont have a hidden test' do
    @exercice.tests = []
    @exercice.tests << build(:test, visible: true)
    @exercice.valid?
    refute_empty @exercice.errors[:tests]
  end
end
