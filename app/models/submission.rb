class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :exercice
  has_many :submissions_tests
  validates :code, presence: true

  def passed?
    tests = SubmissionsTest.select(:pass).where(submission: self)

    tests.each do |test|
      unless test.pass
        return false
      end
    end
    
    true
  end
end
