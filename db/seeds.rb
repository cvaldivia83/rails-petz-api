require 'open-uri'
unsplash_url = 'https://api.unsplash.com/'
client_id = "?client_id=#{ENV['UNSPLASH_ACCESS_KEY']}"

users = %w[ Inti Tula Juniper Petunia Mimosa Bolt Bolinha Athos Rex Farofa ]
https://api.unsplash.com/photos/KZv7w34tluA?client_id=MZBmhlg2xVdmfdNYoaHHp7V7vrMA2abVmcb0V4ldB7I

users.each do |user|
  user = User.new(
    email: "#{user.downcase}@petz.com",
    password: 123456,
    username: user
  )
end

users_photos = %w[ zv9k2ecE6lE KZv7w34tluA tIfrzHxhPYQ wUluw5KzT-s RxHhxWnXmNs tnGEuzqaDDg K4mSJ7kc0As m3PD1h17M yfLG3qsjwEo 75715CVEJhI ]



# user 
user = User.new(
  email: 'carla@lewagon.com',
  password: '123456',
  username: 'cvaldivia'
)

file = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg").open

user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

user.save!