# frozen_string_literal: true

class Submissions::Ide::ExerciceComponent < ViewComponentReflex::Component
  def initialize(exercice:)
    @exercice = exercice
  end
end
