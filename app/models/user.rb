class User < ApplicationRecord
  has_many :characters
  has_many :groups, through: :organizations
  has_many :organizations
  has_secure_password

  def unsubscribe
    self.email = ""
    self.encrypted_password = ""
    self.unsubscribe = true
  end

  def deban
    self.ban = false
    self.ban_until = nil
  end
end
