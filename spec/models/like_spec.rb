require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user, username: "carla2024", email: "carla2024@gmail.com", password: "1234567") }
  let(:post) { create(:post) }
  
  context "post and user references validations" do 

    it "is invalid without a user_id" do 
      like = Like.new(user: nil, post: post)
      expect(like).not_to be_valid
    end

    it "is invalid without a post_id" do 
      like = Like.new(user: user, post: nil)
      expect(like).not_to be_valid
    end

    it "is valid with a user_id and a post_id" do 
      like = Like.new(user: user, post: post)
      expect(like).to be_valid
    end

    it "is valid when the user likes a post for the first time" do 
      like = Like.create(user: user, post: post)
      expect(like).to be_valid
    end

    it "is invalid if the user likes the same post twice" do 
      Like.create(user: user, post: post)
      duplicate_like = Like.new(user: user, post: post)

      expect(duplicate_like).not_to be_valid
    end
  end
end
