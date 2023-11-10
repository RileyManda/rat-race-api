class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :image
      t.text :introduction
      t.text :resume
      t.text :about
      t.text :experience
      t.string :portfolio_link
      t.string :cover_letter

      t.timestamps
    end
  end
end
