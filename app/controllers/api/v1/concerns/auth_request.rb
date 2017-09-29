module AuthRequest
  extend ActiveSupport::Concern

  included do
    before_action :check_request
  end

  protected

  def check_request
    @request = Authorization.new(request.headers)
    render json: { error: 'Not authorized' }, status: :unauthorized unless @request.decode_token
  end
end
