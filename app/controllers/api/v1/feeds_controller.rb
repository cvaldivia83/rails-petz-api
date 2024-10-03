class Api::V1::FeedsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: :show
  # def index
  #   @posts = policy_scope(Post)
  # end
  # 
  def show 
    @feed = Feed.first || Feed.create(title: "main")
    authorize @feed
  end

end