class Api::V1::PostsController < Api::V1::BaseController
  before_action :set_post, only: [ :show, :update, :destroy ]

  def index
    @posts = policy_scope(Post)

    if params[:user_id].present? && params[:posts_number].present?
      @posts = @posts.where(user: params[:user_id].to_i)
                     .order(created_at: :desc)
                     .limit(params[:posts_number].to_i)
    end
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
  end

  def update 
    authorize @post
    if @post.update(post_params)
      render :show
    else
      render_error
    end
  end

  def destroy 
    authorize @post
    @post.destroy
    head :no_content
  end

  private 

  def set_post 
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:description, :photo)
  end

  def render_error
    render json: { errors: @post.errors.full_messages },
      status: :unprocessable_entity
  end
end