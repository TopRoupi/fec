class Language < ApplicationRecord
  validates :name, length: { maximum: 30 }, presence: true
  validates :cod, presence: true, numericality: { greater_than_or_equal_to: 0,
                                                  less_than: 100 }
end
