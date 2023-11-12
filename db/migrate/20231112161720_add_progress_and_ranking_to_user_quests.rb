class AddProgressAndRankingToUserQuests < ActiveRecord::Migration[7.1]
  def change
    add_column :user_quests, :progress, :integer, default: 0
    add_column :user_quests, :ranking, :integer, default: 0
  end
end
