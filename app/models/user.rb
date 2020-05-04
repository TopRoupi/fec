class User < ApplicationRecord
	enum role: [:user, :admin]
	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { maximum: 60 }, presence: true
  validates :password, length: { in: 8..50 }, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
