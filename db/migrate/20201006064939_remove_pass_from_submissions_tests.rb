# frozen_string_literal: true

class RemovePassFromSubmissionsTests < ActiveRecord::Migration[6.0]
  def change
    remove_column :submissions_tests, :pass
  end
end
