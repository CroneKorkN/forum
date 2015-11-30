class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :permissible_type
      t.integer :permissible_id
      t.string :action

      t.timestamps null: false
    end
    add_index :permissions, :permissible_type
    add_index :permissions, :permissible_id
  end
end
