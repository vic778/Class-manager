require 'rails_helper'

RSpec.describe "AddToRooms", type: :request do
  let!(:user) { create(:user) }
  let(:room) { create(:room) }

  describe "POST /rooms/:id/users" do
    it "adds a user to a room" do
      post add_to_rooms_path, params: { user: { username: "new_username" } }
      expect(response).to have_http_status(200)
    end
  end
end
