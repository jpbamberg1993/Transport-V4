json.array!(@user_shipments) do |user_shipment|
  json.extract! user_shipment, :id, :user_id, :shipment_id, :role
  json.url user_shipment_url(user_shipment, format: :json)
end
