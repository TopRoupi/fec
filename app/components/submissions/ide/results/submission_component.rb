# frozen_string_literal: true

class Submissions::Ide::Results::SubmissionComponent < ViewComponentReflex::Component
  def initialize(parent_key, submission:)
    @submission = submission
    @parent_key = parent_key
  end

  def collection_key
    @submission.id
  end

  def remove
    @submission.destroy
    stimulate("Submissions::Ide::ResultsComponent#refresh", {key: @parent_key})
  end
end
