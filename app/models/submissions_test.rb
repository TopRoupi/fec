class SubmissionsTest < ApplicationRecord
  belongs_to :submission
  belongs_to :test
  validates :pass, presence: true
  validates :time_running, 
            numericality: { greater_than: 0 },
            presence: true
  validates :mem_peak,
            numericality: { greater_than: 0,
                            less_than_or_equal_to: 1250 },
            presence: true
end
