class Test < ApplicationRecord
  belongs_to :tests_specification
  has_many :submissions_tests, dependent: :delete_all

  validates :output, presence: true
  validates :input, presence: true
  validates_associated :tests_specification
end
