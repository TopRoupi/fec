# frozen_string_literal: true

class Lists::Index::Component < ApplicationComponent
  def initialize(user:, list:, limit: 6)
    @list = if list == "history"
      user.exercices_history(6)
    else
      list
    end
    @history = "history" if list == "history"
    @user = user
    @limit = limit
  end
end
