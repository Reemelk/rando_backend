class Group < ApplicationRecord
  has_many :organizations
  has_many :users, through: :organizations
  enum status: [:ongoing, :closed, :cancelled]
  before_create :levelp_min_max

  validates_presence_of :user_leader, :name, :minp, :maxp, :server, :levelp, :levelpmin, :levelpmax, :status
  validates_uniqueness_of :name
  validates_inclusion_of :fight_type, in: [true, false]
  validates_numericality_of :user_leader, only_integer: true
  validates_numericality_of :minp, :maxp, only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 8
  validates_numericality_of :levelp, :levelpmin, :levelpmax, only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 200
  validates_numericality_of :range, only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 50

  def levelp_min_max
    self.levelpmin = (self.levelp - self.range).clamp(0, 200)
    self.levelpmax = (self.levelp + self.range).clamp(0, 200)
  end
end
