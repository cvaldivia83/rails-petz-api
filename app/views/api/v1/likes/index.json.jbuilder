json.array! @likes do |like|
  json.extract! like, :id, :user_id, :post_id
end