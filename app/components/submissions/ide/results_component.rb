# frozen_string_literal: true

class Submissions::Ide::ResultsComponent < ViewComponentReflex::Component
  def initialize(submissions:)
    @submissions = submissions
  end
end
