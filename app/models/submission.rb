# frozen_string_literal: true

class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :exercice
  has_many :submissions_tests, dependent: :destroy
  validates :code, presence: true

  before_create :set_submission_tests

  def passed?
    tests = SubmissionsTest.select(:pass).where(submission: self)

    tests.each do |test|
      unless test.pass
        return false
      end
    end

    true
  end

  private

  def set_submission_tests
    exercice.tests_specification.tests.each do |test|
      submissions_tests << SubmissionsTest.new(submission: self, test: test, process_state: :unprocessed)
    end
  end
end
