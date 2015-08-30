require 'rails_helper'
RSpec.describe UserShipmentsController, type: :controller do
  let(:valid_attributes) { 
    FactoryGirl.build(:user_shipments).attributes
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:user_shipments).attributes = nil
  }

  # let(:valid_session) { {} }

  # describe "GET #index" do
  #   it "assigns all user_shipments as @user_shipments" do
  #     user_shipment = UserShipment.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:user_shipments)).to eq([user_shipment])
  #   end
  # end

  # describe "GET #show" do
  #   it "assigns the requested user_shipment as @user_shipment" do
  #     user_shipment = UserShipment.create! valid_attributes
  #     get :show, {:id => user_shipment.to_param}, valid_session
  #     expect(assigns(:user_shipment)).to eq(user_shipment)
  #   end
  # end

  # describe "GET #new" do
  #   it "assigns a new user_shipment as @user_shipment" do
  #     get :new, {}, valid_session
  #     expect(assigns(:user_shipment)).to be_a_new(UserShipment)
  #   end
  # end

  # describe "GET #edit" do
  #   it "assigns the requested user_shipment as @user_shipment" do
  #     user_shipment = UserShipment.create! valid_attributes
  #     get :edit, {:id => user_shipment.to_param}, valid_session
  #     expect(assigns(:user_shipment)).to eq(user_shipment)
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new UserShipment" do
  #       expect {
  #         post :create, {:user_shipment => valid_attributes}, valid_session
  #       }.to change(UserShipment, :count).by(1)
  #     end

  #     it "assigns a newly created user_shipment as @user_shipment" do
  #       post :create, {:user_shipment => valid_attributes}, valid_session
  #       expect(assigns(:user_shipment)).to be_a(UserShipment)
  #       expect(assigns(:user_shipment)).to be_persisted
  #     end

  #     it "redirects to the created user_shipment" do
  #       post :create, {:user_shipment => valid_attributes}, valid_session
  #       expect(response).to redirect_to(UserShipment.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved user_shipment as @user_shipment" do
  #       post :create, {:user_shipment => invalid_attributes}, valid_session
  #       expect(assigns(:user_shipment)).to be_a_new(UserShipment)
  #     end

  #     it "re-renders the 'new' template" do
  #       post :create, {:user_shipment => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested user_shipment" do
  #       user_shipment = UserShipment.create! valid_attributes
  #       put :update, {:id => user_shipment.to_param, :user_shipment => new_attributes}, valid_session
  #       user_shipment.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested user_shipment as @user_shipment" do
  #       user_shipment = UserShipment.create! valid_attributes
  #       put :update, {:id => user_shipment.to_param, :user_shipment => valid_attributes}, valid_session
  #       expect(assigns(:user_shipment)).to eq(user_shipment)
  #     end

  #     it "redirects to the user_shipment" do
  #       user_shipment = UserShipment.create! valid_attributes
  #       put :update, {:id => user_shipment.to_param, :user_shipment => valid_attributes}, valid_session
  #       expect(response).to redirect_to(user_shipment)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns the user_shipment as @user_shipment" do
  #       user_shipment = UserShipment.create! valid_attributes
  #       put :update, {:id => user_shipment.to_param, :user_shipment => invalid_attributes}, valid_session
  #       expect(assigns(:user_shipment)).to eq(user_shipment)
  #     end

  #     it "re-renders the 'edit' template" do
  #       user_shipment = UserShipment.create! valid_attributes
  #       put :update, {:id => user_shipment.to_param, :user_shipment => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested user_shipment" do
  #     user_shipment = UserShipment.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => user_shipment.to_param}, valid_session
  #     }.to change(UserShipment, :count).by(-1)
  #   end

  #   it "redirects to the user_shipments list" do
  #     user_shipment = UserShipment.create! valid_attributes
  #     delete :destroy, {:id => user_shipment.to_param}, valid_session
  #     expect(response).to redirect_to(user_shipments_url)
  #   end
  # end

end
