class Character < ApplicationRecord
  belongs_to :user
  validates_numericality_of :user_id, only_integer: true
  validates_length_of :pseudo, in: 3..33
  validates_numericality_of :level, greater_than_or_equal_to: 0, less_than_or_equal_to: 200
end
