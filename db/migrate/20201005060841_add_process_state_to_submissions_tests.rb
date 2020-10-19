# frozen_string_literal: true

class AddProcessStateToSubmissionsTests < ActiveRecord::Migration[6.0]
  def change
    add_column :submissions_tests, :process_state, :integer, deafult: 0
  end
end
