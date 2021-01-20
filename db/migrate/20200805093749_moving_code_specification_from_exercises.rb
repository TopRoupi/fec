# frozen_string_literal: true

class MovingCodeSpecificationFromExercises < ActiveRecord::Migration[6.0]
  def change
    remove_column :exercises, :code
    remove_column :exercises, :limit_time
    remove_column :exercises, :limit_mem
    remove_column :exercises, :language_id

    add_column :exercises, :complete, :boolean

    remove_column :tests, :exercise_id
    add_reference :tests, :tests_specification, index: true
  end
end
