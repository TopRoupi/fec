# frozen_string_literal: true

class Exercices::HorizontalCard::Component < ApplicationComponent
  def initialize(exercice:, list: nil)
    @exercice = exercice
    @list = list
  end
end
