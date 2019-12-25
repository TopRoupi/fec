class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.references :exercice, null: false, foreign_key: true
      t.string :input
      t.string :output

      t.timestamps
    end
  end
end
