class Exercice < ApplicationRecord
  belongs_to :category
  belongs_to :language
  has_many :tests
  accepts_nested_attributes_for :tests,
                                reject_if: :all_blank,
                                allow_destroy: true
  validates :level,
            presence: true,
            numericality: { greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 5 }
  validates :limit_mem,
            presence: true,
            numericality: { greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 2.5 }
  validates :limit_time,
            presence: true,
            numericality: { greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 5 }
  validates :content, presence: true
  validates :code, presence: true
  validates :name, length: { maximum: 30 }, presence: true
end
