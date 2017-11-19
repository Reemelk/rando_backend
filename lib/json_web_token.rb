class JsonWebToken
  class << self
    def encode(user_id)
      ongoing_group = User.find(user_id).groups.exists?(status: :ongoing)
      puts ongoing_group
      payload = { sub: user_id, iat: Time.now.to_i, exp: 24.hours.from_now.to_i, ongoing_g: ongoing_group }
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, {algorithm: 'HS256'})[0] # First hash of array
      return HashWithIndifferentAccess.new(decoded_token)
    rescue JWT::InvalidSubError, JWT::InvalidIatError, JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
      return false
    end

    def set_ongoing_group(token)
      payload = self.decode(token)
      payload[:ongoing_g] = !payload[:ongoing_g]
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
  end
end
