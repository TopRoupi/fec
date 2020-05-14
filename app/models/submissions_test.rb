class SubmissionsTest < ApplicationRecord
  belongs_to :submission
  belongs_to :test
  validates :description, presence: true
end
