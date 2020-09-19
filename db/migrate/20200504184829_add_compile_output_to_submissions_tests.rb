# frozen_string_literal: true

class AddCompileOutputToSubmissionsTests < ActiveRecord::Migration[6.0]
  def change
    add_column :submissions_tests, :compile_output, :string
  end
end
