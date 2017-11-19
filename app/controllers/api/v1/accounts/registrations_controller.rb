class Api::V1::Accounts::RegistrationsController < Api::V1::ApiController
  skip_before_action :check_request

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      head :ok, status: :created
    else
      render json: { errors: @user.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
