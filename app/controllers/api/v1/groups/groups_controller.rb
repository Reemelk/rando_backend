class Api::V1::Groups::GroupsController < Api::V1::ApiController
  skip_before_action :check_request, only: :show
  before_action :group_authorization, only: :show

  def index
    @groups = Group.select(:id, :name, :maxp, :organizations_count).where("fight_type = ? AND server = ? AND status = 0 AND ? BETWEEN levelpmin AND levelpmax", params[:type], params[:server], params[:level])
    render json: @groups, status: :accepted
  end

  def show
    @group = GroupSession.new(params).which_path?
    render json: @group, status: :accepted
  end

  def create
    @group = Group.new(group_params)
    @group.users << User.find(token_user_id)
    if @group.save
      render json: { token: JsonWebToken.set_ongoing_group(current_token), group_id: @group.id }, status: :created
    else
      head :unprocessable_entity
    end
  end

  def update
    @group = Grouping.new(params).proceed_to_actions
    if @group.errors.empty?
      render json: { token: JsonWebToken.set_ongoing_group(current_token) }, status: :ok
    else
      head :locked if @group.errors[:limit_group].any?
      head :not_acceptable if @group.errors[:already_in_group].any?
    end
  end

  private

  def group_params
    params.require(:group).permit(:user_leader, :name, :minp, :maxp, :server, :fight_type, :levelp, :range)
  end

  protected

  def group_authorization
    @payload = JsonWebToken.decode(current_token)
    @users = User.joins(:groups).where(groups: {id: params[:id]}).select(:id)
    head :forbidden unless @users.exists?(@payload[:sub])
  end
end
