class Api::V1::Accounts::RegistrationsController < ApplicationController
  skip_before_action :check_request

  def create
    user = User.new(user_params)
    if user.save
      render json: { userCreated: 'Vous êtes dorénavant inscrit !' }, status: :created
    else
      render json: { errors: @user.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
