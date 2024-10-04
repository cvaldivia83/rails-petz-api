class Api::V1::FeedsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: :show

  def show 
    @feed = Feed.first || Feed.create(title: "main")
    authorize @feed

    @posts = Post.all.order(:created_at)
  end

end