class CreateExercices < ActiveRecord::Migration[6.0]
  def change
    create_table :exercices do |t|
      t.references :category, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.string :name
      t.integer :level
      t.text :code
      t.float :limit_time
      t.float :limit_mem

      t.timestamps
    end
  end
end
