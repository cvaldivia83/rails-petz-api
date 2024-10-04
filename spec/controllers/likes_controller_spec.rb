require 'rails_helper'

RSpec.describe Api::V1::LikesController, type: :request do 
  let (:post) { create(:post) }
  let (:user) { create(:user) }
  let (:like) { create(:like) }
  
  before do
    login_as(user, scope: :user)  # Logs in the user
  end

  describe "GET #show" do 
    it "returns a 200 status code" do 
      
      get api_v1_like_path(like.id)

      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do 
    it "creates a new like" do 
      expect{ like }.to change(Like, :count).by(1)
    end
  end

  describe "DELETE #destroy" do 
    it "deletes a selected like" do 
      delete api_v1_like_path(like.id)

      expect(response).to have_http_status(204)
    end
  end
end