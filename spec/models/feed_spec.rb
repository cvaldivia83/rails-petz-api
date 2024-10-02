require 'rails_helper'

RSpec.describe Feed, type: :model do
  let (:feed) { Feed.new }

  context "when title is empty" do 

    it "should not be valid" do 
      expect(feed).not_to be_valid
    end

    it "should not save" do 
      expect(feed.save).to be_falsey
    end
  end

  context "when title is not empty" do 
    let(:feed) { create(:feed) } 

    it "it should be valid" do 
      expect(feed).to be_valid
    end

    it "should save" do 
      expect(feed.save).to be_truthy
    end
  end
end
