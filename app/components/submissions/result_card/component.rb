# frozen_string_literal: true

class Submissions::ResultCard::Component < ApplicationComponent
  def initialize(submission:)
    @submission = submission
  end

  def result_class
    case @submission.result
    when "correct"
      "subm-correct"
    when "incorrect"
      "subm-incorrect"
    else
      "bg-light"
    end
  end
end
