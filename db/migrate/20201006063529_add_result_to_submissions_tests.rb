# frozen_string_literal: true

class AddResultToSubmissionsTests < ActiveRecord::Migration[6.0]
  def change
    add_column :submissions_tests, :result, :integer
  end
end
