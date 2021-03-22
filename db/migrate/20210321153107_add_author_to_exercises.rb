class AddAuthorToExercises < ActiveRecord::Migration[6.1]
  def change
    add_reference :exercises, :author, null: false, foreign_key: { to_table: "users"}
  end
end
