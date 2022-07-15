require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user) { create(:user) }

  describe "PUT /users/:id" do
    it "updates user" do
      put user_path(user), params: { user: { username: "new_username" } }
      expect(response).to have_http_status(200)
    end
  end
end
