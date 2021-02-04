# frozen_string_literal: true

class Lists::Index::Component < ApplicationComponent
  def initialize(user:, list:, limit: 6)
    if list == "history"
      @exercises = user.exercises_history(limit)
      @list = List.new(name: "History", description: "Submissions history")
    else
      @exercises = list.exercises.limit(limit)
      @list = list
    end
    @history = "history" if list == "history"
    @user = user
    @limit = limit
  end

  def component_id
    if @history
      "history"
    else
      helpers.dom_id(@list)
    end
  end

  def active_url?
    helpers.current_page?(component_url)
  end

  def component_url
    @history ? helpers.list_path("history") : helpers.list_path(@list)
  end
end
