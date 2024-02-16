class CreateGroupEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :group_entities do |t|
      t.references :group, foreign_key: { to_table: :groups }
      t.references :entity, foreign_key: { to_table: :entities }

      t.timestamps
    end
  end
end
