class Authorization
  def initialize(headers = {})
    @headers = headers
  end

  def decode_token
    JsonWebToken.decode(pull_token)
  end

  def pull_token
    @headers.present? ? @headers['Authorization'].split(' ')[1] : false
  end
end
