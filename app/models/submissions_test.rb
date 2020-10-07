# frozen_string_literal: true

class SubmissionsTest < ApplicationRecord
  belongs_to :submission
  belongs_to :test
  validates :description, presence: true, unless: :unprocessed?
  validates :result, presence: true, unless: :unprocessed?
  validates :process_state, presence: true
  enum process_state: [:unprocessed, :processing, :processed]
  enum result: [:correct, :incorrect]
end
