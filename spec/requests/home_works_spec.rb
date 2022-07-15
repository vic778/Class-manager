require 'rails_helper'

RSpec.describe "HomeWorks", type: :request do
  context "when as a teacher" do
    let!(:user) { create(:user, :teacher) }
    let!(:room) { create(:room) }
    let!(:home_works) { create_list(:home_work, 10, room:, user:) }

    describe "GET /home_works" do
      before { get room_home_works_path(room) }
      it "returns a list of home_works" do
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /home_works/:id" do
      before { get room_home_work_path(room, home_works.first) }
      it "returns a home_work" do
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /home_works" do
      before { post room_home_works_path(room), params: { home_work: { assignment: "Test", user_id: user.id, room_id: room.id } } }
      it "creates a new home_work" do
        expect(response).to have_http_status(200)
      end
    end

    describe "PUT /home_works/:id" do
      before { put room_home_work_path(room, home_works.first), params: { home_work: { assignment: "Test" } } }
      it "updates a home_work" do
        expect(response).to have_http_status(200)
      end
    end

    describe "DELETE /home_works/:id" do
      before { delete room_home_work_path(room, home_works.first) }
      it "deletes a home_work" do
        expect(response).to have_http_status(200)
      end
    end
  end
end
