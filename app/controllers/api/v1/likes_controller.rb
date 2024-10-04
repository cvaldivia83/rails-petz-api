class Api::V1::LikesController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_post, only: [ :create ]

  def index
    @likes = policy_scope(Like)
  end
  def show 
    @like = Like.find(params[:id])
    authorize @like
  end

  def create 
    @like = Like.new
    @like.post = @post
    @like.user = current_user 
    authorize @like
    if @like.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy 
    @like = Like.find(params[:id])
    authorize @like
    @like.destroy 
    head :ok
  end

  private 

  def like_params 
    params.require(:like).permit(:user)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def render_error
    render json: { errors: @like.errors.full_messages },
      status: :unprocessable_entity
  end
end