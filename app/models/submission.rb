class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :exercice
  validates :code, presence: true
end
