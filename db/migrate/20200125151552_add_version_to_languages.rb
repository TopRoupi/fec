class AddVersionToLanguages < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :version, :string
  end
end
