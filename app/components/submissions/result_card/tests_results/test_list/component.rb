# frozen_string_literal: true

class Submissions::ResultCard::TestsResults::TestList::Component < ApplicationComponent
  def initialize(tests_results:)
    @tests_results = tests_results
  end
end
