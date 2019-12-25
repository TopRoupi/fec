class CreateExercices < ActiveRecord::Migration[6.0]
  def change
    create_table :exercices do |t|
      t.references :category, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.string :name
      t.numeric :level
      t.string :content
      t.string :code
      t.numeric :limit_time
      t.numeric :limit_mem

      t.timestamps
    end
  end
end
