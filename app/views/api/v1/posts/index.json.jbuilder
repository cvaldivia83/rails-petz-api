json.array! @posts do |post|
  json.extract! post, :id, :description
  json.username post.user.username
  json.photo_url post.photo.attached? ? url_for(post.photo) : ''
end