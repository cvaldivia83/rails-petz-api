require 'rails_helper'

RSpec.describe Api::V1::FeedsController, type: :request do 
  let (:feed) { create(:feed) }

  describe "GET /api/v1/feeds/:id" do
    it "returns a 200 status code" do 
      get api_v1_feed_path(feed.id)

      expect(response).to have_http_status(200)
    end
  end
end