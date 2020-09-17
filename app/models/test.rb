class Test < ApplicationRecord
  belongs_to :tests_specification

  validates :output, presence: true
  validates :input, presence: true
  validates_associated :tests_specification
end
