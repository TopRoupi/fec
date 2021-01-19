# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :list_exercices
  has_many :exercices, through: :list_exercices

  validates :name, length: {maximum: 60}, presence: true
  validates :privacy, presence: true

  enum privacy: [:private_list, :notlisted_list, :public_list]

  after_initialize :set_default_privacy, if: :new_record?

  private

  def set_default_privacy
    self.privacy ||= :private_list
  end
end
