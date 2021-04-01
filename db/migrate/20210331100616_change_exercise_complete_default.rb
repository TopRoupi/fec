class ChangeExerciseCompleteDefault < ActiveRecord::Migration[6.1]
  def change
    change_column :exercises, :complete, :boolean, deafult: false
  end
end
