class Test < ApplicationRecord
  belongs_to :exercice
  validates :output, presence: true
  validates :input, presence: true
  validates :visible, presence: true
end
