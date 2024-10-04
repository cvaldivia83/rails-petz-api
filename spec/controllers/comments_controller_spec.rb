require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :request do 
  let (:post) { create(:post) }
  let (:comment) { create(:comment) }
  let (:user) { create(:user) }

  before do
    login_as(user, scope: :user)  # Logs in the user
  end

  describe "GET #show" do
    it "returns a 200 status code" do 
      get api_v1_comment_path(comment.id)

      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do 
    it "creates a new comment" do 
      expect{ comment }.to change(Comment, :count).by(1)
    end
  end

  describe "DELETE #destroy" do 
    it "deletes a selected comment" do 
      comment_one = Comment.create(description: "hello world", user: user, post: post)

      delete api_v1_comment_path(comment_one.id)

      expect(response).to have_http_status(200)
    end
  end
end