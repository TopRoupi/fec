# frozen_string_literal: true

class Submissions::Ide::TestsResults::Component < ApplicationComponent
  def initialize(exercise:, user:)
    @submissions = user.submissions.where(exercise: exercise)
  end
end
