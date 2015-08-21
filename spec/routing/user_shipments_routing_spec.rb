require "rails_helper"

RSpec.describe UserShipmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_shipments").to route_to("user_shipments#index")
    end

    it "routes to #new" do
      expect(:get => "/user_shipments/new").to route_to("user_shipments#new")
    end

    it "routes to #show" do
      expect(:get => "/user_shipments/1").to route_to("user_shipments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_shipments/1/edit").to route_to("user_shipments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_shipments").to route_to("user_shipments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_shipments/1").to route_to("user_shipments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_shipments/1").to route_to("user_shipments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_shipments/1").to route_to("user_shipments#destroy", :id => "1")
    end

  end
end
