class CreateJobApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :job_applications do |t|
      t.bigint :user_id, null: false
      t.bigint :role_id, null: false
      t.text :cover_letter
      t.text :resume
      t.boolean :status, default: false

      t.timestamps
    end

    add_index :job_applications, [:user_id, :role_id], unique: true

    add_foreign_key :job_applications, :users
    add_foreign_key :job_applications, :roles
  end
end
