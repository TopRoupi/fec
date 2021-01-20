# frozen_string_literal: true

class ListExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :list
end
