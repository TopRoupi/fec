# frozen_string_literal: true

class Submissions::ResultCard::Component < ApplicationComponent
  def initialize(submission:)
    @submission = submission
  end
end
