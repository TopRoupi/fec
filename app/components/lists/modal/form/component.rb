# frozen_string_literal: true

class Lists::Modal::Form::Component < ApplicationComponent
  def initialize(exercice:, list:)
    @list = list
    @exercice = exercice
  end
end
