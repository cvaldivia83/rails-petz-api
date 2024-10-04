class Api::V1::CommentsController < Api::V1::BaseController
  before_action :set_post, only: [ :create ]

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
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def destroy 
    
  end

  private 

  def comment_params 
    params.require(:comment).permit(:description)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end