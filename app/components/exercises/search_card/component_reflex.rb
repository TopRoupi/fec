# frozen_string_literal: true

class Exercises::SearchCard::ComponentReflex < ApplicationReflex
  def search
    @exercises = if params["search"]["name"].empty?
      Exercise.all.limit(6)
    else
      Exercise.fuzzy_search(name: params["search"]["name"])
    end
  end
end
