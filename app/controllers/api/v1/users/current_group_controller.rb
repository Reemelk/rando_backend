class Api::V1::Users::CurrentGroupController < Api::V1::ApiController
  def show
    @current_group_user = Group.where(status: :ongoing)
                                .joins(:users).where("users.id = ?", params[:id]).pluck(:id).first
    render json: { current_group: @current_group_user }, status: :ok
  end
end
