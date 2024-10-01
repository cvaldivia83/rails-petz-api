require 'rails_helper'
require 'open-uri'

RSpec.describe User, type: :model do
  it "creates an instance of User with username and avatar" do 
    maria = User.new(email: 'maria@gmail.com', password: 123456, username: 'mamá')

    file = URI.parse('https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D').open

    maria.avatar.attach(io: file, filename: "maria.png", content_type: "image/png")

    maria.save

    expect(maria.avatar.attached?).to eq(true)
  end

  it "creates an instance of User without avatar" do
    joao = User.new(email: 'joao@gmail.com', password: 123456, username: 'jojo')
    joao.save

    expect(joao.avatar.attached?).to eq(false)
  end

  it "creates an instance of User where username has at least 2 digits" do
    user = User.new(email: 'user@gmail.com', password: 12345678, username: 'F')

    
    expect(user.username.length).to be >= 2
  end
end