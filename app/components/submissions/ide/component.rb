# frozen_string_literal: true

class Submissions::Ide::Component < ApplicationComponent
  def initialize(exercise:, user:, page:)
    @user = user
    @exercise = exercise
    @page = page ? page.to_sym : :editor
    @last_submission = Submission.where(exercise: exercise, user: user).last
    @languages = Language.all
  end
end
