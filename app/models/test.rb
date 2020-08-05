class TestValidator < ActiveModel::Validator
  def validate(record)
    # broke the tests if running on parallel
    return unless record.exercice.language
    code = Rextester.new(lang_id: record.exercice.language.cod,
                         code: record.exercice.code,
                         input: record.input)
    if code.run != record.output
      record.errors[:output] << "do not match with code output"
    end
  end
end

class Test < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :tests_specification
  
  validates :output, presence: true
  validates :input, presence: true
  validates_associated :tests_specification
  # validates_with TestValidator
end
