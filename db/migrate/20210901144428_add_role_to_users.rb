class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def self.up
    add_column :users, :role, :integer, default: 0
  end

  def self.down
    remove_column :users, :role
  end
end
