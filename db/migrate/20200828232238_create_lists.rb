class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :description
      t.integer :privacy
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
