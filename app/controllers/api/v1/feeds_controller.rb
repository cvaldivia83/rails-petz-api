class Api::V1::FeedsController < Api::V1::BaseController
  # def index
  #   @posts = policy_scope(Post)
  # end
  # 
  def show 
    @feed = Feed.first
    authorize @feed
  end
end