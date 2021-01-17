# frozen_string_literal: true

class ListsModal::Component < ApplicationComponent
  def initialize(exercice:, user:)
    @exercice = exercice
    @list = List.new
    @list.owner_id = user.id
    @list.privacy = nil
  end
end
