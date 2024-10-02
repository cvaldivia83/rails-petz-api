json.array! @posts do |post|
  json.extract! post, :id, :description, :user_id
end