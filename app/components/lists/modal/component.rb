# frozen_string_literal: true

class Lists::Modal::Component < ApplicationComponent
  def initialize(exercise:, user:)
    @exercise = exercise

    @list = List.new
    @list.owner_id = user.id
    @list.privacy = nil

    @lists = user.all_lists
  end
end
