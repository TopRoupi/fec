# frozen_string_literal: true

class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :exercice
  has_many :tests_results, class_name: :SubmissionsTest, foreign_key: :submission_id, dependent: :destroy
  validates :code, presence: true
  enum result: [:correct, :incorrect]
  before_create :set_tests

  def process_tests
    tests_results.unprocessed.each do |testr|
      token = get_test_result_token(testr)
      CreateSubmissionTestJob.perform_later(token, testr)
    end
  end

  def process_tests!
    tests_results.unprocessed.each do |testr|
      token = get_test_result_token(testr)
      CreateSubmissionTestJob.perform_now(token, testr)
    end

    set_result
  end

  def set_result
    if tests_results.processing.any? or tests_results.unprocessed.any?
      update(result: nil)
    elsif tests_results.incorrect.any?
      update(result: :incorrect)
    else
      update(result: :correct)
    end
  end

  private

  def get_test_result_token(testr)
    params = {
      "source_code": code,
      "language_id": language.cod,
      "stdin": testr.test.input,
      "expected_output": testr.test.output,
      "cpu_time_limit": testr.test.tests_specification.limit_time,
      "memory_limit": testr.test.tests_specification.limit_mem * 1024
    }

    Judge0.get_token(params)
  end

  def set_tests
    exercice.tests_specification.tests.each do |test|
      tests_results << SubmissionsTest.new(submission: self, test: test, process_state: :unprocessed)
    end
  end
end
