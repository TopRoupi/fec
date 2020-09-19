# frozen_string_literal: true

class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.text :code
      t.references :user, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.references :exercice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
