class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :exercice
end
