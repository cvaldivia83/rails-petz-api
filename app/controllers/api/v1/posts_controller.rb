class Api::V1::PostsController < Api::V1::BaseController

  def index 
    @posts = policy_scope(Post)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post 
    if @post.save 
      render :show, status: :created
    else
      render_error
    end
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  private 

  def post_params
    params.require(:post).permit(:description, :photo)
  end

  def render_error
    render json: { errors: @post.errors.full_messages },
      status: :unprocessable_entity
  end
end