# frozen_string_literal: true

class Exercise < ApplicationRecord
  self.per_page = 10
  include ActiveModel::Validations
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_one :tests_specification, dependent: :delete
  has_many :submissions
  has_many :users, -> { distinct }, through: :submissions

  validates :level,
    presence: true,
    numericality: {greater_than_or_equal_to: 0,
                   less_than_or_equal_to: 5}
  validates :content, presence: true
  validates :name, length: {maximum: 30}, presence: true

  after_create :create_empty_test_specification

  def correct_submissions_percentage
    return 0 if users.empty?
    users_with_correct_submissions.count / users.count.to_f * 100
  end

  def users_with_correct_submissions
    correct_id = Submission.results["correct"]
    users.joins(:submissions).where('"submissions_users"."result" = ? ', correct_id)
  end

  def users_without_correct_submissions
    users - users_with_correct_submissions
  end

  def submissions_by_unique_users
    users.map { |user| user.submissions.where(exercise: self) }
  end

  def excerpt
    content.split("\n").first
  end

  private

  def create_empty_test_specification
    Language.new.save(validate: false) unless Language.first

    if tests_specification.blank?
      ts = TestsSpecification.new(exercise: self, language: Language.first)
      ts.save(validate: false)
    end
  end
end
