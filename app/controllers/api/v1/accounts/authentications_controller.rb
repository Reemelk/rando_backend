class Api::V1::Accounts::AuthenticationsController < Api::V1::ApiController
  skip_before_action :check_request

  def create
    @auth = Authentication.new(auth_params)

    if @auth.user.instance_of? User
      render json: { token: @auth.create_token }, status: :ok
    else
      head :unauthorized
    end
  end

  private

  def auth_params
    params.require(:user).permit(:email, :password)
  end
end
