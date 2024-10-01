require 'open-uri'

# user 
user = User.new(
  email: 'carla@lewagon.com',
  password: '123456',
  username: 'cvaldivia'
)

file = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg").open

user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

user.save!