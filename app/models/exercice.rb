class Exercice < ApplicationRecord
  belongs_to :category
  belongs_to :language
  has_many :tests
  accepts_nested_attributes_for :tests, reject_if: :all_blank, allow_destroy: true
  has_rich_text :content
end
