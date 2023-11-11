class AddUserIdToSkills < ActiveRecord::Migration[7.1]
  def change
    add_reference :skills, :user, null: false, foreign_key: true
  end
end
