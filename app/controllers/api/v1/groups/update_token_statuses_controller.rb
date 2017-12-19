class Api::V1::Groups::UpdateTokenStatusesController < Api::V1::Groups::GroupsController
  skip_before_action :check_request, only: :show
  before_action :group_authorization, only: :show

  def show
    @updated_token = $redis.get("tokens:users:#{@payload[:sub]}")
    remove_token
    render json: { token: @updated_token }, status: :created
  end

  private

  def remove_token
    $redis.del("tokens:users:#{@payload[:sub]}")
  end
end
