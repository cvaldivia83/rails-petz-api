require 'rails_helper'

RSpec.describe Comment, type: :model do
  let (:comment) { Comment.new }
  context "when description is empty" do 

    it "should not be valid" do 
      expect(comment.valid?).to be_falsey
    end

    it "should not save" do
      expect(comment.save).to be_falsey
    end

  end

  context "when description is not empty" do 
    let (:user) { create(:user,  username: "Bob", email: "bob@gmail.com", password: "1234567") }

    let (:comment) { create(:comment, user_id: user.id) }

    it "should be valid" do
      expect(comment.valid?).to be_truthy
    end

    it "should save" do 
      expect(comment.save).to be_truthy
    end
  end
end
