# frozen_string_literal: true

class SubmissionsTest < ApplicationRecord
  belongs_to :submission
  belongs_to :test
  validates :description, presence: true, unless: :unprocessed?
  enum process_state: [:unprocessed, :processing, :processed]
end
