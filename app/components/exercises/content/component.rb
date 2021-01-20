# frozen_string_literal: true

class Exercises::Content::Component < ApplicationComponent
  def initialize(exercise:)
    @exercise = exercise
  end
end
