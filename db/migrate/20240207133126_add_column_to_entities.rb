class AddColumnToEntities < ActiveRecord::Migration[7.1]
  def change
    add_column :entities, :group_id, :integer
    add_foreign_key :entities, :groups
  end
end
