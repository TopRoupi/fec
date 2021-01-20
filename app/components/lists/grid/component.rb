# frozen_string_literal: true

class Lists::Grid::Component < ApplicationComponent
  def initialize(user:)
    @user = user
  end
end
