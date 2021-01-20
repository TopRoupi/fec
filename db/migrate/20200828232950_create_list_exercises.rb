# frozen_string_literal: true

class CreateListExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :list_exercises do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
