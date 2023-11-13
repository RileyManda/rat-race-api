class RenameRoleTypeToRoleInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :role_type, :role
  end
end