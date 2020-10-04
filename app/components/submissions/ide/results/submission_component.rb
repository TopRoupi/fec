# frozen_string_literal: true

class Submissions::Ide::Results::SubmissionComponent < ViewComponentReflex::Component
  def initialize(submission:)
    @submission = submission
  end
end
