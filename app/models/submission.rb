class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :exercice
  has_many :submissions_tests
  validates :code, presence: true
end
