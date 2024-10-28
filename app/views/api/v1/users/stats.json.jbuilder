json.extract! @user, :id, :email, :username
json.posts_count @posts_count
json.comments_count @comments_count