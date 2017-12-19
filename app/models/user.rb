class User < ApplicationRecord
  has_secure_password
  has_many :characters, dependent: :destroy
  has_many :organizations
  has_many :groups, through: :organizations

  validates_uniqueness_of :username, :email
  validates_length_of :username, in: 3..30
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

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
