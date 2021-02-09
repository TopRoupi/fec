# frozen_string_literal: true

class Lists::Index::Component < ApplicationComponent
  def initialize(user:, list:, limit: 6, editing: nil)
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
    @editing = editing
  end

  def component_id
    if @history
      "history"
    else
      helpers.dom_id(@list)
    end
  end

  def active_url?
    url = if @editing
      helpers.edit_list_path(@list)
    else
      component_url
    end
    helpers.current_page?(url)
  end

  def component_url
    @history ? helpers.list_path("history") : helpers.list_path(@list)
  end
end
