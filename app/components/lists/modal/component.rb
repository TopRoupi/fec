# frozen_string_literal: true

class Lists::Modal::Component < ApplicationComponent
  def initialize(exercise:, user:)
    @exercise = exercise

    @list = List.new
    @list.owner_id = user.id
    @list.privacy = nil

    @lists = if user.have_correct_submission_in? @exercise
      user.lists
    else
      user.all_lists
    end
  end
end
