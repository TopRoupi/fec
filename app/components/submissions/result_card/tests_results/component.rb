# frozen_string_literal: true

class Submissions::ResultCard::TestsResults::Component < ApplicationComponent
  def initialize(visible:, tests_results:)
    @tests_results = tests_results
    @title = visible ? "Visible" : "Hidden"
    @visible = visible
  end
end
