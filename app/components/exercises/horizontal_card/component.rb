# frozen_string_literal: true

class Exercises::HorizontalCard::Component < ApplicationComponent
  def initialize(exercise:, attributes: [:solved_percentage, :category, :solved_status, :level, :add_to_list])
    @exercise = exercise
    @attributes = attributes
  end
end
