class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.integer :name, default: 0, null: false

      t.timestamps
    end
    add_index :roles, :name
  end
end
