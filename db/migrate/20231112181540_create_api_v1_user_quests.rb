class CreateApiV1UserQuests < ActiveRecord::Migration[7.1]
  def change
    create_table :api_v1_user_quests do |t|
      t.bigint :user_id
      t.bigint :quest_id
      t.integer :progress
      t.integer :ranking

      t.timestamps
    end
  end
end
