# frozen_string_literal: true

class Lists::Modal::Form::Component < ApplicationComponent
  def initialize(exercise:, list:)
    @list = list
    @exercise = exercise
  end
end
