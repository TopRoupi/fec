# frozen_string_literal: true

class Submissions::Ide::Component < ApplicationComponent
  def initialize(exercice:, user:, page:)
    @user = user
    @exercice = exercice
    @page = page ? page.to_sym : :editor
    @last_submission = Submission.where(exercice: exercice, user: user).last
    @languages = Language.all
  end
end
