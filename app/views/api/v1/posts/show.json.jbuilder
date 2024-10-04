json.extract! @post, :id, :description, :user_id
json.comments @post.comments do |comment|
  json.extract! comment, :id, :description, :user_id
end