class User < ApplicationRecord
  has_many :submissions
  has_one :do_later_list, class_name: 'List', foreign_key: :owner_id
  enum role: [:user, :admin]
  after_initialize :set_default_role, if: :new_record?
  after_initialize :set_do_later_list, if: :new_record?
  has_many :notifications, as: :recipient

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { maximum: 60 }, presence: true
  validates :password, length: { maximum: 50 }, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true

  def have_correct_submission_in?(exercice)
    submissions.where(exercice: exercice).reject { |sub| sub.passed? }.empty?
  end

  private

  def set_do_later_list
    self.do_later_list = List.new(
      name: 'Do later list',
      description: 'Procastination list',
      privacy: :private_list,
      owner: self
    )
  end

  def set_default_role
    self.role ||= :user
  end
end
