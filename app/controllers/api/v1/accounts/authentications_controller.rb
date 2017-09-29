class Api::V1::Accounts::AuthenticationsController < Api::V1::ApplicationController
  skip_before_action :check_request

  def create
    auth = Authentication.new(auth_params)

    if auth.user.instance_of? User
      render json: { token: auth.create_token }, status: :ok
    else
      render json: { error: "Email et/ou mot de passe incorrect !" }, status: :unauthorized
    end
  end

  private

  def auth_params
    params.require(:authentication).permit(:email, :password)
  end
end
