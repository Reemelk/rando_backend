class Api::V1::ApiController < ApplicationController
  before_action :check_request

  protected

  def check_request
    @request = Authorization.new(request.headers)
    head :unauthorized unless @request.decode_token
  end

  def current_token
    @request = Authorization.new(request.headers)
    @request.pull_token
  end

  def token_user_id
    JsonWebToken.decode(current_token)['sub']
  end
end
