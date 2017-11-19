class User < ApplicationRecord
  has_secure_password
  has_many :characters, dependent: :destroy
  has_many :organizations
  has_many :groups, through: :organizations

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def unsubscribe
    self.email = ""
    self.password_digest = ""
    self.unsubscribe = true
  end

  def deban
    self.ban = false
    self.ban_until = nil
  end
end
