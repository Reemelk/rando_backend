class JsonWebToken
  class << self
    def encode(user_id)
      payload = { sub: user_id, iat: Time.now.to_i, exp: 24.hours.from_now.to_i }
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)[0] # First hash of array
      return HashWithIndifferentAccess.new(decoded_token)
    rescue JWT::InvalidSubError, JWT::InvalidIatError, JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
      return false
    end
  end
end
