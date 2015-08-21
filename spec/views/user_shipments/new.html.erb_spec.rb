require 'rails_helper'

RSpec.describe "user_shipments/new", type: :view do
  before(:each) do
    assign(:user_shipment, UserShipment.new(
      :user => nil,
      :shipment => nil,
      :role => "MyString"
    ))
  end

  it "renders new user_shipment form" do
    render

    assert_select "form[action=?][method=?]", user_shipments_path, "post" do

      assert_select "input#user_shipment_user_id[name=?]", "user_shipment[user_id]"

      assert_select "input#user_shipment_shipment_id[name=?]", "user_shipment[shipment_id]"

      assert_select "input#user_shipment_role[name=?]", "user_shipment[role]"
    end
  end
end
