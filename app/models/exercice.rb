class Exercice < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :category
  has_one :tests_specification, dependent: :delete

  validates :level,
            presence: true,
            numericality: { greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 5 }
  validates :content, presence: true
  validates :name, length: { maximum: 30 }, presence: true
  
  after_create :create_empty_test_specification
  
  private
  
  def create_empty_test_specification
    Language.new().save(validate: false)  unless Language.first
    
    if tests_specification.blank?
      ts = TestsSpecification.new(exercice: self, language: Language.first)
      ts.save(validate: false)
    end
  end
end
