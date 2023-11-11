class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.bigint :company_id, null: false
      t.string :name
      t.text :description
      t.string :type, null: false
      t.string :location
      t.decimal :salary, precision: 10, scale: 2

      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.index [:company_id, :name], unique: true, name: 'index_roles_on_company_id_and_name'
    end

    add_foreign_key :roles, :companies
  end
end

