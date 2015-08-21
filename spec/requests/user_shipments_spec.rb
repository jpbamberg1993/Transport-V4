require 'rails_helper'

RSpec.describe "UserShipments", type: :request do
  describe "GET /user_shipments" do
    it "works! (now write some real specs)" do
      get user_shipments_path
      expect(response).to have_http_status(200)
    end
  end
end
