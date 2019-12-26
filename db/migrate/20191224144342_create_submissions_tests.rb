class CreateSubmissionsTests < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions_tests do |t|
      t.references :submission, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.boolean :pass
      t.integer :time_running
      t.text :output
      t.text :errors
      t.text :warnings
      t.float :mem_peak

      t.timestamps
    end
  end
end
