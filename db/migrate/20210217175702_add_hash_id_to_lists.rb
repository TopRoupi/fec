class AddHashIdToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :hash_id, :string, index: true
  end
end
