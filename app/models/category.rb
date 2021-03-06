# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, length: {maximum: 30}, presence: true
end
