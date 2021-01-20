# frozen_string_literal: true

class Exercises::HorizontalCard::Component < ApplicationComponent
  def initialize(exercise:)
    @exercise = exercise
  end
end
