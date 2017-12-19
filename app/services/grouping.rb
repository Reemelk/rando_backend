class Grouping
  def initialize(params)
    @user = params[:user_id].present? ? User.find(params[:user_id]) : nil
    @group = Group.find(params[:id])
    @status = params[:status] || nil
  end

  def proceed_to_actions
    group_action if [@user, @group].all?(&:present?)
    group_status if @status.present?
    @group
  end

  # Actions
  def group_action
    @group.users.exists?(@user.id) ? remove_user : add_user
    group_ongoing_cache
  end

  def group_status
    @status.eql?('closed') ? @group.closed! : @group.cancelled!
    group_closed_cache
    store_new_token
  end

  def add_user
    @group.errors.add(:limit_group, 'Le nombre maximal de joueurs pour ce groupe a été atteint') if @group.organizations_count >= @group.maxp
    @group.errors.add(:already_in_group, 'Vous êtes déjà dans un groupe') if @user.groups.exists?(status: :ongoing)
    @group.users << @user if @group.errors.empty?
  end

  def remove_user
    @group.users.delete(@user)
  end

  def group_ongoing_cache
    $redis.set("group:#{@group.id}", @group.to_json(only: [:id, :user_leader, :name, :server, :maxp, :fight_type, :status, :organizations_count]))
  end

  def group_closed_cache
    $redis.set("group:#{@group.id}", @group.to_json(only: [:id, :user_leader, :name, :server, :fight_type, :status], include: {users: {only: [:id, :username]}}))
    $redis.expire("group:#{@group.id}", 24.hour.to_i)
  end

  def store_new_token
    group = JSON.load($redis.get("group:#{@group.id}") || @group.to_json(only: [:id, :user_leader, :name, :server, :fight_type, :organizations_count], include: {users: {only: [:id, :username]}}))
    group["users"].delete_if {|h| h["id"] == group["user_leader"]}
    group["users"].each do |user|
      updated_token = JsonWebToken.encode(user["id"])
      $redis.set("tokens:users:#{user["id"]}", updated_token)
    end
  end
end
