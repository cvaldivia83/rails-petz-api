class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user! 
  
  def index
    @users = policy_scope(User)
  end

  def show
    authorize current_user 

    @user = {
      id: current_user.id,
      email: current_user.email,
      username: current_user.username,
      avatar_url: current_user.avatar.atacched? ? current_user.avatar.url : ''
    }
    render json: @user, status: :ok
  end

  def validate_token
    authorize current_user
    render json: { valid: true, message: 'Token is valid'}, status: :ok
  end

end