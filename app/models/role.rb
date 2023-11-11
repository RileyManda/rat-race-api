class Role < ApplicationRecord
  belongs_to :company
  has_many :applications, dependent: :destroy
  has_many :applicants, through: :applications, source: :user
end
