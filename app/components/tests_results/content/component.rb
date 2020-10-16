# frozen_string_literal: true

class TestsResults::Content::Component < ApplicationComponent
  def initialize(test_result:)
    @testr = test_result
  end
end
