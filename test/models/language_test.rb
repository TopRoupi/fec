require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  setup do
    @language = build(:language)
  end

  # name validations

  test 'invalid without a name' do
    @language.name = nil
    @language.valid?
    refute_empty @language.errors[:name]
  end

  test 'valid if name have 30 characters' do
    @language.name = '0' * 30
    @language.valid?
    assert_empty @language.errors[:name]
  end

  test 'invalid if name have more than 30 characters' do
    @language.name = '0' * 31
    @language.valid?
    refute_empty @language.errors[:name]
  end

  ## cod validations

  test 'invalid without a cod' do
    @language.cod = nil
    @language.valid?
    refute_empty @language.errors[:cod]
  end

  test 'invalid if cod is greater than 99' do
    @language.cod = 100
    @language.valid?
    refute_empty @language.errors[:cod]
  end

  test 'invalid if cod is less than 0' do
    @language.cod = -1
    @language.valid?
    refute_empty @language.errors[:cod]
  end

  test 'valid with a cod less than 99' do
    @language.cod = 99
    @language.valid?
    assert_empty @language.errors[:cod]
  end

  test 'valid with a cod greater than 0' do
    @language.cod = 1
    @language.valid?
    assert_empty @language.errors[:cod]
  end
end
