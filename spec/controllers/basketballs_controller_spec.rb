require 'rails_helper'

RSpec.describe Api::BasketballsController, type: :controller do
  describe "GET #index" do
    before do
      get :index, format: :json
    end

    it "returns http status success 200" do
      expect(response).to have_http_status(200)
    end

    it "responds with JSON body containing expected players" do
      hash_body = JSON.parse(response.body)
      expect(hash_body["players"].length).to eq(Basketball.all.length)
    end
  end
end
