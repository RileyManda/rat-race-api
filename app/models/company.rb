class Company < ApplicationRecord
    has_many :roles, dependent: :destroy
end
