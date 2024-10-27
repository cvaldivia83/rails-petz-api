class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:profile, :validate_token]
  
  def index
    @users = policy_scope(User)
  end

  def profile 
    @user = User.find(params[:id])
    authorize @user
  end

  def show
    authorize current_user 

    @user = {
      id: current_user.id,
      email: current_user.email,
      username: current_user.username,
      avatar_url: current_user.avatar.attached? ? current_user.avatar.url : ''
    }
    render json: @user, status: :ok
  end

  def validate_token
    authorize current_user
    render json: { valid: true, message: 'Token is valid'}, status: :ok
  end

  def stats 
    @user = current_user
    @posts = Post.where(user: @user)
    @comments_count = Comment.where(post: @posts).count
  end

end