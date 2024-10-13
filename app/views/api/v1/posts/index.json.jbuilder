json.array! @posts do |post|
  json.extract! post, :id, :description
  json.username post.user.username
  json.photo_url post.photo.attached? ? post.photo.url : ''
end