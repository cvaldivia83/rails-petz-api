require 'rails_helper'

RSpec.describe Post, type: :model do
  let (:post) { Post.new }
  context "when description is empty" do

    it "should not be valid" do
      expect(post.valid?).to be_falsey
    end

    it "should not save" do
      expect(post.save).to be_falsey
    end

  end

  context "when description is not empty" do
    let(:post) { create(:post) } 
    

    it "it should be valid" do
      expect(post.valid?).to be_truthy
    end

    it "should save" do 
      expect(post.save).to be_truthy
    end
  end
end


