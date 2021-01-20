# frozen_string_literal: true

class Exercises::Card::Component < ApplicationComponent
  def initialize(exercise:)
    @exercise = exercise
  end
end
