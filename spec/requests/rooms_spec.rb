require 'rails_helper'
require '././spec/support/login_helpers.rb'

RSpec.describe "Rooms", type: :request do
  context "when as an amdin" do
    let!(:user) { create(:user, :admin) }
    let(:room) { create(:room) }

    describe "GET /rooms" do
      it "returns a list of rooms" do
        get rooms_path
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /rooms/:id" do
      it "returns a room" do
        get room_path(room)
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /rooms" do
      it "creates a room" do
        post rooms_path, params: { room: { name: "New Room" } }
        expect(response).to have_http_status(200)
      end
    end

    describe "PUT /rooms/:id" do
      it "updates a room" do
        put room_path(room), params: { room: { name: "New Room" } }
        expect(response).to have_http_status(200)
      end
    end

    describe "DELETE /rooms/:id" do
      it "deletes a room" do
        delete room_path(room)
        expect(response).to have_http_status(200)
      end
    end
    
  end
  
end
