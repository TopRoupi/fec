# frozen_string_literal: true

class Submissions::IdeComponent < ViewComponentReflex::Component
  def initialize(exercice:, user:, page:)
    @user = user
    @exercice = exercice
    @page = page ? page.to_sym : :editor
    @last_submission = Submission.where(exercice: exercice, user: user).last
    @submissions = Submission.where(exercice: exercice, user: user)
    @languages = Language.all
  end
end
