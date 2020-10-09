# frozen_string_literal: true

class Exercices::Card::Component < ApplicationComponent
  def initialize(exercice:)
    @exercice = exercice
  end
end
