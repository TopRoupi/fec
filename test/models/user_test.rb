require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = build(:user)
  end

  # name validations

  test 'invalid without a name' do
    @user.name = nil
    @user.valid?
    refute_empty @user.errors[:name]
  end

  test 'valid if name have 60 or less characters' do
    @user.name = '0' * 60
    @user.valid?
    assert_empty @user.errors[:name]
  end

  test 'invalid if name have more than 60 characters' do
    @user.name = '0' * 61
    @user.valid?
    refute_empty @user.errors[:name]
  end

  # password validations

  # test 'invalid without a password' do
  #   @user.password = nil
  #   @user.valid?
  #   refute_empty @user.errors[:password]
  # end

  # test 'invalid if password have 8 or less characters' do
  #   @user.password = '0' * 8
  #   @user.valid?
  #   refute_empty @user.errors[:password]
  # end

  # test 'invalid if password have more than 50 characters' do
  #   @user.password = '0' * 51
  #   @user.valid?
  #   refute_empty @user.errors[:password]
  # end

  # test 'valid if password have more than 8 characters' do
  #   @user.password = '0' * 9
  #   @user.valid?
  #   refute_empty @user.errors[:password]
  # end

  # test 'valid if password is less or equals to 50 characters' do
  #   @user.password = '0' * 50
  #   @user.valid?
  #   refute_empty @user.errors[:password]
  # end

  # email validations

  test 'invalid without a email' do
    @user.email = nil
    @user.valid?
    refute_empty @user.errors[:email]
  end
end
