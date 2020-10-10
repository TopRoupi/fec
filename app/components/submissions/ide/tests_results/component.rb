# frozen_string_literal: true

class Submissions::Ide::TestsResults::Component < ApplicationComponent
  def initialize(exercice:, user:)
    @submissions = user.submissions.where(exercice: exercice)
  end
end
