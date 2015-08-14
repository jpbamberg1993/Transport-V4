json.array!(@offers) do |offer|
  json.extract! offer, :id, :amount, :user_id, :shipment_id
  json.url offer_url(offer, format: :json)
end
