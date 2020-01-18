class ExerciceValidator < ActiveModel::Validator
  def validate(record)
    hidden_tests = record.tests.select { |e| e.visible == false }.length
    visible_tests = record.tests.select { |e| e.visible == true }.length

    if visible_tests == 0
      record.errors[:tests] << "shall have at least 1 visible test"
    end
    if hidden_tests == 0
      record.errors[:tests] << "shall have at least 1 hidden test"
    end
  end
end

class Exercice < ApplicationRecord
  include ActiveModel::Validations
  validates_with ExerciceValidator
  belongs_to :category
  belongs_to :language
  has_many :tests, dependent: :delete_all
  accepts_nested_attributes_for :tests,
                                reject_if: :all_blank,
                                allow_destroy: true
  validates :level,
            presence: true,
            numericality: { greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 5 }
  validates :limit_mem,
            presence: true,
            numericality: { greater_than: 0,
                            less_than_or_equal_to: 1250 }
  validates :limit_time,
            presence: true,
            numericality: { greater_than: 0,
                            less_than_or_equal_to: 5 }
  validates :content, presence: true
  validates :code, presence: true
  validates :name, length: { maximum: 30 }, presence: true
end
