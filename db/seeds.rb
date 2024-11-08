require 'open-uri'
require "json"
require 'faker'



puts "Started seeds"

Post.destroy_all
User.destroy_all

puts "Destroyed all records"

puts "Creating users..."


unsplash_url = 'https://api.unsplash.com/'
client_id = "client_id=#{ENV['UNSPLASH_ACCESS_KEY']}"

users = %w[ Inti Tula Juniper Petunia Mimosa Bolt Bolinha Athos Rex Farofa ]

photo_ids = %w[ zv9k2ecE6lE KZv7w34tluA tIfrzHxhPYQ wUluw5KzT-s RxHhxWnXmNs tnGEuzqaDDg K4mSJ7kc0As m3PD1h17M yfLG3qsjwEo 75715CVEJhI ]

users.each_with_index do |user, index|
  
  new_user = User.new(
    email: "#{user.downcase}@petz.com",
    password: 123456,
    username: user
  )

  url = "#{unsplash_url}photos/#{photo_ids[index]}?#{client_id}"
  photo_serialized = URI.parse(url).read
  photo_hash = JSON.parse(photo_serialized)
  photo_url = photo_hash['urls']['regular']

  file = URI.parse(photo_url).open

  new_user.avatar.attach(io: file, filename: "pet_#{index + 1}.jpg", content_type: 'image/jpg')

  new_user.save!

  puts "Created #{user} - user n.#{index + 1}"

  sleep(2)
end

puts "Creating 3 posts for each user..."

all_users = User.all

all_users.each_with_index do |user, index|

  3.times do |i|
    post = Post.new(
      description: Faker::Lorem.sentences.join(" "),
      user: user
    )
  
    url = "#{unsplash_url}/photos/random?orientation=portrait&query=pet&client_id=#{client_id}"
    photo_serialized = URI.parse(url).read
    photo_hash = JSON.parse(photo_serialized)
    photo_url = photo_hash['urls']['regular']
  
    post.photo.attach(io: file, filename: "post_#{user.username}_#{i + 1}.jpg", content_type: 'image/jpg')
  
    post.save!

    if i == 2
      puts "Created 3 posts from #{user.username}"
    end
  end

end

puts "Posts created"

posts = Post.all

posts.each_with_index do |post, index|

  amount = rand(1..5)

  amount.times do 
    comment = Comment.new(
      description: Faker::Lorem.sentences.join(" "),
      user: all_users.sample,
      post: post
    )

    comment.save!
  end
end

puts 'Seeds are over!'