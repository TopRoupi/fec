class AddResultToSubmission < ActiveRecord::Migration[6.0]
  def change
    add_column :submissions, :result, :integer
  end
end
