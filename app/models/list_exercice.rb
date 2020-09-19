# frozen_string_literal: true

class ListExercice < ApplicationRecord
  belongs_to :exercice
  belongs_to :list
end
