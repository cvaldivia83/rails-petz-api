json.extract! @comment, :id, :description, :user_id, :post_id
json.username @comment.user.username