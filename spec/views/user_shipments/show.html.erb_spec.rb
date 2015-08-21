require 'rails_helper'

RSpec.describe "user_shipments/show", type: :view do
  before(:each) do
    @user_shipment = assign(:user_shipment, UserShipment.create!(
      :user => nil,
      :shipment => nil,
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Role/)
  end
end
