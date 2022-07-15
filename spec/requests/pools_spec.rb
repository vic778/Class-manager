require 'rails_helper'

RSpec.describe "Pools", type: :request do
  context "when as an admin" do
   let!(:user) { create(:user, :admin) }
  
    describe "GET /pools" do
      before { get pools_path }
      it "returns a list of students in a pools where status is true" do
        expect(response).to have_http_status(200)
      end
    end  
  end
  
end
