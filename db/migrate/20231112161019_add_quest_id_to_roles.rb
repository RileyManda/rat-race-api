class AddQuestIdToRoles < ActiveRecord::Migration[7.1]
  def change
     add_reference :roles, :quest, foreign_key: true
  end
end
