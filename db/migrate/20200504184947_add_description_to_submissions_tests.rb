# frozen_string_literal: true

class AddDescriptionToSubmissionsTests < ActiveRecord::Migration[6.0]
  def change
    add_column :submissions_tests, :description, :string
  end
end
