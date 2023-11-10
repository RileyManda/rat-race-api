class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :institution
      t.string :degree
      t.integer :graduation_year

      t.timestamps
    end
  end
end
