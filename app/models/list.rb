class List < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :list_exercices
  has_many :exercices, -> { unscope(:order).distinct },through: :list_exercices

  enum privacy: [:private_list, :notlisted_list, :public_list]

  after_initialize :set_default_privacy, if: :new_record?

  private

  def set_default_privacy
    self.privacy ||= :private_list
  end
end
