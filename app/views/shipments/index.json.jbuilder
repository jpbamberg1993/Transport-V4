json.array!(@shipments) do |shipment|
  json.extract! shipment, :id, :origin, :destination, :mode_of_transportation, :equipment_type, :minimum_commitment, :maximum_commitment, :cost, :user_id
  json.url shipment_url(shipment, format: :json)
end
