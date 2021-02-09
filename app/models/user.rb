# frozen_string_literal: true

class User < ApplicationRecord
  has_many :submissions
  has_one :do_later_list, class_name: "List", foreign_key: :owner_id
  has_many :lists, ->(user) { where("id != ?", user.do_later_list.id) }, foreign_key: :owner_id
  has_many :all_lists, class_name: "List", foreign_key: :owner_id
  enum role: [:user, :admin]
  after_initialize :set_default_role, if: :new_record?
  after_initialize :set_do_later_list, if: :new_record?
  has_many :notifications, as: :recipient
  has_many :exercises, through: :submissions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :name, length: {maximum: 60}, presence: true
  validates :password, length: {maximum: 50}, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true

  def have_correct_submission_in?(exercise)
    submissions.where(exercise: exercise).correct.any?
  end

  def have_on_do_later_list?(exercise)
    do_later_list.exercises.exists? exercise.id
  end

  def exercises_history(limit = 6)
    exercises.order('"submissions"."created_at" DESC').limit(limit).uniq
  end

  def solved_exercises
    correct_id = Submission.results["correct"]
    exercises.where('"submissions"."result" = ?', correct_id).uniq
  end

  def unsolved_exercises
    incorrect_id = Submission.results["incorrect"]
    exercises.where('"submissions"."result" = ?', incorrect_id).uniq
  end

  private

  def set_do_later_list
    self.do_later_list = List.new(
      name: "Do later list",
      description: "Exercises added in this list will be automaticaly removed after solved, and you can't add solved exercises in this list.",
      privacy: :private_list,
      owner: self
    )
  end

  def set_default_role
    self.role ||= :user
  end
end
