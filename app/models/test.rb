class Test < ApplicationRecord
  belongs_to :exercice
  validates :output, presence: true
  validates :input, presence: true
end
