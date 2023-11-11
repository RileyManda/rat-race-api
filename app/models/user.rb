class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :educations, dependent: :destroy

  has_many :applications, dependent: :destroy
  has_many :applied_jobs, through: :applications, source: :job
end
