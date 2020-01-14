require 'test_helper'

class SubmissionsTestTest < ActiveSupport::TestCase
  setup do
    @submissions_test = build(:submissions_test)
  end

  # pass validations

  test 'invalid with pass = nil' do
    @submissions_test.pass = nil
    @submissions_test.valid?
    refute_empty @submissions_test.errors[:pass]
  end

  # time_running validations

  test 'invalid without time_running' do
    @submissions_test.time_running = nil
    @submissions_test.valid?
    refute_empty @submissions_test.errors[:time_running]
  end

  test 'invalid if time_running is less than 0' do
    @submissions_test.time_running = -1
    @submissions_test.valid?
    refute_empty @submissions_test.errors[:time_running]
  end

  test 'invalid if time_running is equals to 0' do
    @submissions_test.time_running = 0
    @submissions_test.valid?
    refute_empty @submissions_test.errors[:time_running]
  end

  # mem_peak validations

  test 'invalid without mem_peak' do
    @submissions_test.mem_peak = nil
    @submissions_test.valid?
    refute_empty @submissions_test.errors[:mem_peak]
  end


  test 'valid if mem_peak is less or equals to 1250' do
    @submissions_test.mem_peak = 1250
    @submissions_test.valid?
    assert_empty @submissions_test.errors[:mem_peak]
  end

  test 'invalid if mem_peak is less than 0' do
    @submissions_test.mem_peak = -1
    @submissions_test.valid?
    refute_empty @submissions_test.errors[:mem_peak]
  end

  test 'invalid if mem_peak is equals to 0' do
    @submissions_test.mem_peak = 0
    @submissions_test.valid?
    refute_empty @submissions_test.errors[:mem_peak]
  end

  test 'invalid if mem_peak is greater than 1250' do
    @submissions_test.mem_peak = 1251
    @submissions_test.valid?
    refute_empty @submissions_test.errors[:mem_peak]
  end
end
