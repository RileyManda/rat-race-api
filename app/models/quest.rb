class Quest < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :duration, numericality: { greater_than: 0 }

  has_many :user_quests
  has_many :users, through: :user_quests
end
