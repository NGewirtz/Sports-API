require 'rails_helper'

RSpec.describe Api::PlayersController, type: :controller do
  describe "GET #show" do
    let(:valid_player) { { sport: 'Baseball', first: "Jacob", last: "deGrom" } }
    let(:invalid_last_name) { { sport: 'Baseball', first: "Jacob", last: "deGromINATOR" } }
    let(:invalid_sport) { { sport: 'Football', first: "Jacob", last: "deGrom" } }

    describe "valid query" do
      before do
        get :show, params: valid_player, format: :json
      end

      it "returns http status success 200 with valid params" do
        expect(response).to have_http_status(200)
      end

      it "responds with JSON body containing expected player with valid params" do
        hash_body = JSON.parse(response.body)
        response_player = hash_body["players"].first
        expect(response_player["first_name"]).to eq(valid_player[:first])
        expect(response_player["last_name"]).to eq(valid_player[:last])
      end
    end

    describe "invalid query" do
      it "returns http status not found 404 with invalid last_name" do
        get :show, params: invalid_last_name, format: :json
        expect(response).to have_http_status(404)
      end

      it "returns http status not found 404 with invalid sport" do
        get :show, params: invalid_sport, format: :json
        expect(response).to have_http_status(404)
      end

      it "responds with JSON body containing error message with invalid params" do
        get :show, params: invalid_last_name, format: :json
        hash_body = JSON.parse(response.body)
        expect(hash_body).to eq({ "Error" => "Player Not Found"} )
      end
    end
  end
end
