class AddRankingToRoles < ActiveRecord::Migration[7.1]
  def change
    add_column :roles, :ranking, :integer, default: 0
  end
end