# frozen_string_literal: true

class List < ApplicationRecord
  include Friendlyable

  belongs_to :owner, class_name: "User"
  has_many :list_exercises
  has_many :exercises, through: :list_exercises

  validates :name, length: {maximum: 60}, presence: true
  validates :privacy, presence: true
  validates :description, length: {maximum: 255}

  enum privacy: [:private_list, :notlisted_list, :public_list]

  after_initialize :set_default_privacy, if: :new_record?

  private

  def set_default_privacy
    self.privacy ||= :private_list
  end
end
