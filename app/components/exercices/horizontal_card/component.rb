# frozen_string_literal: true

class Exercices::HorizontalCard::Component < ApplicationComponent
  def initialize(exercice:)
    @exercice = exercice
  end
end
