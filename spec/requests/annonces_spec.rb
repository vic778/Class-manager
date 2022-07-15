require 'rails_helper'

RSpec.describe "Annonces", type: :request do
  context "when as an admin" do
    let!(:user) { create(:user, :admin) }

    describe "POST /annonces" do
      it "creates an annonce" do
        post annonces_path, params: { annonce: { message: "New Annonce" } }
        expect(response).to have_http_status(200)
      end
    end

    describe "PUT /annonces" do
      let!(:annonce) { create(:annonce) }

      it "updates an annonce" do
        put annonce_path(annonce), params: { annonce: { message: "Updated Annonce" } }
        expect(response).to have_http_status(200)
      end
    end

    describe "DELETE /annonces" do
      let!(:annonce) { create(:annonce) }

      it "deletes an annonce" do
        delete annonce_path(annonce)
        expect(response).to have_http_status(200)
      end
    end

  end

    let!(:annonce) { create(:annonce) }
    let(:annonce_params) { attributes_for(:annonce) }

    describe "GET /annonces" do
      it "returns a list of annonces" do
        get annonces_path
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /annonces/:id" do
      it "returns a annonce" do
        get annonce_path(annonce)
        expect(response).to have_http_status(200)
      end
    end
end
