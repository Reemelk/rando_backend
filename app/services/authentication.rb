class Authentication
  def initialize(params)
    @params = params
  end

  def user
    @user = auth
  end

  def create_token
    @jwt = JsonWebToken.encode(@user.id)
  end

  def auth
    begin
      @user = User.find_by!(email: @params[:email])
    rescue ActiveRecord::RecordNotFound
      return false
    end
    @user&.authenticate(@params[:password])
  end
end
