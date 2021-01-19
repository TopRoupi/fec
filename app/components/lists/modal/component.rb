# frozen_string_literal: true

class Lists::Modal::Component < ApplicationComponent
  def initialize(exercice:, user:)
    @exercice = exercice
    @list = List.new
    @list.owner_id = user.id
    @list.privacy = nil
  end
end
