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
end