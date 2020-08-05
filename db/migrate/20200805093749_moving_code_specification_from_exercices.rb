class MovingCodeSpecificationFromExercices < ActiveRecord::Migration[6.0]
  def change
    remove_column :exercices, :code
    remove_column :exercices, :limit_time
    remove_column :exercices, :limit_mem
    remove_column :exercices, :language_id
    
    add_column :exercices, :complete, :boolean

    remove_column :tests, :exercice_id
    add_reference :tests, :tests_specification, index: true
  end
end
