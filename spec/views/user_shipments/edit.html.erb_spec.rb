require 'rails_helper'

RSpec.describe "user_shipments/edit", type: :view do
  before(:each) do
    @user_shipment = assign(:user_shipment, UserShipment.create!(
      :user => nil,
      :shipment => nil,
      :role => "MyString"
    ))
  end

  it "renders the edit user_shipment form" do
    render

    assert_select "form[action=?][method=?]", user_shipment_path(@user_shipment), "post" do

      assert_select "input#user_shipment_user_id[name=?]", "user_shipment[user_id]"

      assert_select "input#user_shipment_shipment_id[name=?]", "user_shipment[shipment_id]"

      assert_select "input#user_shipment_role[name=?]", "user_shipment[role]"
    end
  end
end
