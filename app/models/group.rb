class Group < ApplicationRecord
  has_many :users, through: :organizations
  has_many :organizations
end
