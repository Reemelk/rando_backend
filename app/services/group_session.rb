class GroupSession
  def initialize(params)
    @group = Group.find(params[:id])
  end

  def which_path?
    @group.ongoing? ? group_without_assocs : group_with_assocs
  end

  def group_without_assocs
    g = $redis.get("group:#{@group.id}")
    if g.nil?
      g = @group.to_json(only: [:id, :user_leader, :name, :server, :fight_type, :organizations_count])
      $redis.set("group:#{@group.id}", g)
    end
    @group = JSON.load(g)
  end

  def group_with_assocs
    g = $redis.get("group:#{@group.id}")
    if g.nil?
      g = @group.to_json(only: [:id, :name, :server, :fight_type, :status], include: {users: {only: [:id, :username]}})
      $redis.set("group:#{@group.id}", g)
    end
    @group = JSON.load(g)
    @token = update_status_token?
    return @group, @token
  end

  def update_status_token?
    @user_id = JsonWebToken.decode(current_token)['sub']
    $redis.get("tokens:users:#{@user_id}").nil? if true
  end
end
