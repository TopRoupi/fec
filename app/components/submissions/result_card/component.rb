# frozen_string_literal: true

class Submissions::ResultCard::Component < ApplicationComponent
  def initialize(submission:)
    @submission = submission
  end

  def result_class
    case @submission.result
    when "correct"
      "bg-success"
    when "incorrect"
      "bg-danger"
    else
      "bg-light"
    end
  end
end
