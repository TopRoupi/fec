# frozen_string_literal: true

class TestsSpecificationValidator < ActiveModel::Validator
  def validate(record)
    hidden_tests = record.tests.count { |e| e.visible == false }
    visible_tests = record.tests.count { |e| e.visible == true }

    if visible_tests == 0
      record.errors.add(:tests, "shall have at least 1 visible test")
    end
    if hidden_tests == 0
      record.errors.add(:tests, "shall have at least 1 hidden test")
    end
  end
end

class TestsSpecification < ApplicationRecord
  belongs_to :exercise
  belongs_to :language
  has_many :tests, dependent: :delete_all
  after_commit :update_exercise_state, only: [:create, :update]

  validates_with TestsSpecificationValidator
  validates :limit_mem,
    presence: true,
    numericality: {greater_than_or_equal_to: 10,
                   less_than_or_equal_to: 250}
  validates :limit_time,
    presence: true,
    numericality: {greater_than: 0,
                   less_than_or_equal_to: 5}
  validates :code, presence: true

  accepts_nested_attributes_for :tests,
    reject_if: :all_blank,
    allow_destroy: true

  def update_exercise_state
    exercise.complete = valid?
    exercise.save!
  end
end
