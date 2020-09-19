# frozen_string_literal: true

class CreateTestsSpecifications < ActiveRecord::Migration[6.0]
  def change
    create_table :tests_specifications do |t|
      t.text :code
      t.float :limit_time
      t.float :limit_mem
      t.references :exercice, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
