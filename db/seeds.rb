# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create( id: 1, email: "chrisalan313@gmail.com", password: "wyncoder", company_name: "Company 1" )
#
# User.create( id: 2, email: "example@example.com", password: "wyncoder", company_name: "Company 2")
#
# Shipment.create( id: 4, origin: "Here", destination: "There", mode_of_transportation: "Something", equipment_type: "Something", minimum_commitment: 1, maximum_commitment: 2, cost: 2222, user_id: 1 )
#
# Offer.create( id: 2, amount: 222222, user_id: 2, shipment_id: 4 )

# => Create Shippers
shippers = 3.times do |n|
  User.create(company_name: "#{n} Shipper", role: "shipper", email: "shipper#{n}@example.com",  password: "password")
end

# => Create Carriers
carriers = 15.times do |n|
  User.create(company_name: "#{n} Carrier", role: "carrier", email: "carrier#{n}@example.com",  password: "password")
end

# => Get random locations for easy population
# => You can add more into the array
def rand_loc
  locations = ["FL", "GA", 'TN', 'AL', 'KY', 'NY', 'NJ']
  locations[rand(locations.count)]
end

# => Create Shipments
shipments = 3.times do |n|
  Shipment.create(origin: rand_loc, destination: rand_loc, mode_of_transportation: "Full load", equipment_type: "Box Truck", minimum_commitment: 0, maximum_commitment: 0, cost: 100)
end

# => Create UserShipments
UserShipment.create(user_id: 1, shipment_id: 1, role: 'shipper')
UserShipment.create(user_id: 2, shipment_id: 2, role: 'shipper')
UserShipment.create(user_id: 3, shipment_id: 3, role: 'shipper')
