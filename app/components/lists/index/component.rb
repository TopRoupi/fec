# frozen_string_literal: true

class Lists::Index::Component < ApplicationComponent
  def initialize(user:, list:, limit: 6)
    @list = if list == "history"
      user.exercises_history(6)
    else
      list
    end
    @history = "history" if list == "history"
    @user = user
    @limit = limit
  end
end
