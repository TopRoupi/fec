class CreateSubmissionsTests < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions_tests do |t|
      t.references :submission, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.boolean :pass
      t.numeric :time_running
      t.string :output
      t.string :errors
      t.string :warnings
      t.numeric :mem_peak

      t.timestamps
    end
  end
end
