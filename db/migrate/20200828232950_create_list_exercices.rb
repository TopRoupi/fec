class CreateListExercices < ActiveRecord::Migration[6.0]
  def change
    create_table :list_exercices do |t|
      t.references :exercice, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
