require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :request do 
  let (:posts) { create_list(:post, 3) }
  let (:user) { create(:user) }
  let(:post) { create(:post, user: user, description: "Old content") }


  before do
    login_as(user, scope: :user)  # Logs in the user
  end
  
  describe "GET #index" do
    it "returns a 200 status code" do 
      get api_v1_posts_path

      expect(response).to have_http_status(200)
    end
  end


  describe "GET #show" do 
    it "returns a 200 status code" do 
      
      get api_v1_post_path(posts[0].id)

      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH #update" do 
    it "returns an updated value to the description" do
      patch api_v1_post_path(post.id), params: { post: { description: "New Content" } }

      post.reload

      expect(post.description).to eq("New Content")
    end
  end
end