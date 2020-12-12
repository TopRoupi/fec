# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :tests_specification
  has_many :submissions_tests, dependent: :delete_all

  validates :output, presence: true
  validates :input, presence: true
  validates_associated :tests_specification
  scope :visible, -> { where(visible: true) }
  scope :hidden, -> { where(visible: false) }
end
