# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.references :exercise, null: false, foreign_key: true
      t.text :input
      t.text :output
      t.boolean :visible

      t.timestamps
    end
  end
end
