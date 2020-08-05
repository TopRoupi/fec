require 'test_helper'

class ExerciceTest < ActiveSupport::TestCase
  setup do
    @exercice = build(:exercice)
  end
  
  test 'create a test specification after create a new exercice' do
    exercice = create :exercice, tests_specification: nil
    refute_nil exercice.tests_specification
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
  
  test 'valid if level is between 0 and 5' do
    for i in 1..5
      @exercice.level = i
      @exercice.valid?
      assert_empty @exercice.errors[:level]
    end
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

  # content validatins

  test 'invalid without content' do
    @exercice.content = nil
    @exercice.valid?
    refute_empty @exercice.errors[:content]
  end
end
