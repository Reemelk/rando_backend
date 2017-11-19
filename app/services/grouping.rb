class Grouping
  def initialize(params)
    @user = params[:user_id].present? ? User.find(params[:user_id]) : nil
    @group = Group.find(params[:id])
    @status = params[:status] || nil
  end

  def call
    group_action if [@user, @group].all?(&:present?)
    group_status if @status.present?
    @group
  end

  # Actions
  def group_action
    @group.users.exists?(@user.id) ? remove_user : add_user
  end

  def group_status
    @group.update_attributes(status: @status)
  end

  def add_user
    @group.errors.add(:limit_group, 'Vous avez atteint le maxium de joueur pour ce groupe') if @group.users.count >= @group.maxp
    @group.errors.add(:already_in_group, 'Vous êtes déjà dans un groupe') if @user.groups.detect { |status| status.ongoing? }
    @group.users << @user if @group.errors.empty?
  end

  def remove_user
    @group.users.delete(@user)
  end
end
