json.extract! @post, :id, :description, :user_id
json.username @post.user.username
json.photo_url @post.photo.attached? ? @post.photo.url : ''
json.comments @post.comments do |comment|
  json.extract! comment, :id, :description, :user_id, :post_id
  json.username comment.user.username
end