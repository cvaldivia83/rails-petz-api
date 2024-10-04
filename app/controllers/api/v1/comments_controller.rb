class Api::V1::CommentsController < Api::V1::BaseController
  before_action :set_post, only: [ :create ]
  before_action :set_comment, only: [ :show, :destroy ]

  def create 
    @comment = Comment.new(comment_params)
    @comment.user = current_user 
    @comment.post = @post
    authorize @comment
    if @comment.save 
      render :show, status: :created 
    else
      render_error
    end
  end

  def index
    @comments = policy_scope(Comment)
  end

  def show 
    @comment.destroy 

  end

  def destroy 
    authorize @comment
    @comment.destroy
    head :ok
  end

  private 

  def comment_params 
    params.require(:comment).permit(:description)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment 
    @comment = Comment.find(params[:id])
    authorize @comment
  end
end