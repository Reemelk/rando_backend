class Group < ApplicationRecord
  has_many :organizations
  has_many :users, through: :organizations
  enum status: [:ongoing, :closed, :cancelled]
  before_create :levelp_min_max

  validates :name, presence: true, uniqueness: true
  validates :minp, :maxp,
            presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 8 }
  validates :server, presence: true
  validates :fight_type, inclusion: { in: [true, false] }
  validates :levelp, :levelpmin, :levelpmax,
            presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 200 }
  validates :range, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 50 }
  # validates :status, presence: true

  def levelp_min_max
    self.levelpmin = (self.levelp - self.range).clamp(0, 200)
    self.levelpmax = (self.levelp + self.range).clamp(0, 200)
  end
end
