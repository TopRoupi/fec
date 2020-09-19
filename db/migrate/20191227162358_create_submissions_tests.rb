# frozen_string_literal: true

class CreateSubmissionsTests < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions_tests do |t|
      t.references :submission, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.boolean :pass
      t.float :time_running
      t.text :output
      t.text :code_errors
      t.text :code_warnings
      t.float :mem_peak

      t.timestamps
    end
  end
end
