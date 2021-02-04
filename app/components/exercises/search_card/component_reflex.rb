# frozen_string_literal: true

class Exercises::SearchCard::ComponentReflex < ApplicationReflex
  def search
    search = params["search"]

    @exercises = if search["name"].empty?
      Exercise.all.limit(6)
    else
      Exercise.fuzzy_search(name: search["name"])
    end

    if search["result"]
      @exercises = @exercises.where(id: current_user.solved_exercises) if search["result"] == "Solved"
      @exercises = @exercises.where.not(id: current_user.solved_exercises) if search["result"] == "Unsolved"
    end
    @exercises.where!(level: search["level"]) unless search["level"].blank?
    @exercises.where!(category_id: search["category_id"]) unless search["category_id"].blank?
  end
end
