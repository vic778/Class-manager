require 'rails_helper'

RSpec.describe "StudentUps", type: :request do
  context "when as a student" do
    let!(:user) { create(:user) }
    let!(:room) { create(:room) }
    let!(:home_work) { create(:home_work) }

    describe "GET /student_ups" do
      before { get room_home_work_student_ups_path(room, home_work) }
      it "returns a list of student_ups" do
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /student_ups/:id" do
      before { get room_home_work_student_up_path(room, home_work, user) }
      it "returns a student_up" do
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /student_ups" do
      before { post room_home_work_student_ups_path(room, home_work), params: { student_up: { assignment: "Test" } } }
      it "creates a student_up" do
        expect(response).to have_http_status(200)
      end
    end
  end
end
