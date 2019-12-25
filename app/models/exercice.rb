class Exercice < ApplicationRecord
  belongs_to :category
  belongs_to :language
  has_many :tests
end
