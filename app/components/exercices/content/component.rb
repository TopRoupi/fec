# frozen_string_literal: true

class Exercices::Content::Component < ApplicationComponent
  def initialize(exercice:)
    @exercice = exercice
  end
end
