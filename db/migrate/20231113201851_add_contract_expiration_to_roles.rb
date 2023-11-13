class AddContractExpirationToRoles < ActiveRecord::Migration[7.1]
  def change
    add_column :roles, :contract_expiration, :date
  end
end
