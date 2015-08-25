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
# shippers = 5.times do |n|
#   User.create(company_name: "#{n} Shipper", role: "shipper", email: "shipper#{n}@example.com",  password: "password")
# end

# => Create Shippers
User.create(company_name: "Ruby Shippers, Inc.", role: "shipper", email: "RubyShips@example.com",  password: "password")

# => Create Carriers
# carriers = 15.times do |n|
#   User.create(company_name: "#{n} Carrier", role: "carrier", email: "carrier#{n}@example.com",  password: "password")
# end

# => Create Carriers
User.create(company_name: "Fozzy Freight", role: "carrier", email: "FozzyMoves@example.com",  password: "password")
User.create(company_name: "B&E Brothers", role: "carrier", email: "B&EBros@example.com",  password: "password")
User.create(company_name: "Easy Green Transportation", role: "carrier", email: "Kermit@example.com",  password: "password")
User.create(company_name: "Statler, Inc.", role: "carrier", email: "Statler@example.com",  password: "password")
User.create(company_name: "Waldorf Heckles & Co", role: "carrier", email: "Waldorf@example.com",  password: "password")
User.create(company_name: "Swedish Movers, LLC", role: "carrier", email: "TheChef@example.com",  password: "password")
User.create(company_name: "A+ Carriers", role: "carrier", email: "Animal@example.com",  password: "password")
User.create(company_name: "Rizzo Freight Solutions", role: "carrier", email: "TheRat@example.com",  password: "password")
User.create(company_name: "Great Transport", role: "carrier", email: "Gonzo@example.com",  password: "password")
User.create(company_name: "King Carriers", role: "carrier", email: "Pepe@example.com",  password: "password")

# => Get random locations for easy population
# => You can add more into the array
def rand_loc
  locations = ["FL", "GA", 'TN', 'AL', 'KY', 'NY', 'NJ']
  locations[rand(locations.count)]
end

# # => Create Shipments
# shipments = 3.times do |n|
#   Shipment.create(origin: rand_loc, destination: rand_loc, mode_of_transportation: "Full load", equipment_type: "Box Truck", minimum_commitment: 0, maximum_commitment: 0, cost: 100)
# end

Shipment.create(origin: rand_loc, destination: rand_loc, mode_of_transportation: "Full load", equipment_type: "Box Truck", minimum_commitment: 7, maximum_commitment: 14, cost: 350)
Shipment.create(origin: rand_loc, destination: rand_loc, mode_of_transportation: "Full load", equipment_type: "Box Truck", minimum_commitment: 34, maximum_commitment: 57, cost: 700)
Shipment.create(origin: rand_loc, destination: rand_loc, mode_of_transportation: "Full load", equipment_type: "Box Truck", minimum_commitment: 125, maximum_commitment: 200, cost: 3000)
Shipment.create(origin: rand_loc, destination: rand_loc, mode_of_transportation: "Full load", equipment_type: "Box Truck", minimum_commitment: 4, maximum_commitment: 10, cost: 2500)
Shipment.create(origin: rand_loc, destination: rand_loc, mode_of_transportation: "Full load", equipment_type: "Box Truck", minimum_commitment: 0, maximum_commitment: 2, cost: 2000)
Shipment.create(origin: rand_loc, destination: rand_loc, mode_of_transportation: "Full load", equipment_type: "Box Truck", minimum_commitment: 0, maximum_commitment: 1, cost: 1000)
Shipment.create(origin: rand_loc, destination: rand_loc, mode_of_transportation: "Full load", equipment_type: "Box Truck", minimum_commitment: 45, maximum_commitment: 77, cost: 1300)
Shipment.create(origin: rand_loc, destination: rand_loc, mode_of_transportation: "Full load", equipment_type: "Box Truck", minimum_commitment: 23, maximum_commitment: 89, cost: 1600)
Shipment.create(origin: rand_loc, destination: rand_loc, mode_of_transportation: "Full load", equipment_type: "Box Truck", minimum_commitment: 14, maximum_commitment: 28, cost: 900)
Shipment.create(origin: rand_loc, destination: rand_loc, mode_of_transportation: "Full load", equipment_type: "Box Truck", minimum_commitment: 0, maximum_commitment: 1, cost: 2000)
Shipment.create(origin: rand_loc, destination: rand_loc, mode_of_transportation: "Full load", equipment_type: "Box Truck", minimum_commitment: 0, maximum_commitment: 1, cost: 1000)
#
# # => Create UserShipments for Shippers
UserShipment.create(user_id: 1, shipment_id: 1, role: 'shipper')
UserShipment.create(user_id: 1, shipment_id: 2, role: 'shipper')
UserShipment.create(user_id: 1, shipment_id: 3, role: 'shipper')
UserShipment.create(user_id: 1, shipment_id: 4, role: 'shipper')
UserShipment.create(user_id: 1, shipment_id: 5, role: 'shipper')
UserShipment.create(user_id: 1, shipment_id: 6, role: 'shipper')
UserShipment.create(user_id: 1, shipment_id: 7, role: 'shipper')
UserShipment.create(user_id: 1, shipment_id: 8, role: 'shipper')
UserShipment.create(user_id: 1, shipment_id: 9, role: 'shipper')
UserShipment.create(user_id: 1, shipment_id: 10, role: 'shipper')
UserShipment.create(user_id: 1, shipment_id: 11, role: 'shipper')
#
# # => Create UserShipments for Carriers
#
UserShipment.create(user_id: 2, shipment_id: 1, role: 'carrier')
UserShipment.create(user_id: 2, shipment_id: 2, role: 'carrier')
UserShipment.create(user_id: 2, shipment_id: 3, role: 'carrier')
UserShipment.create(user_id: 2, shipment_id: 4, role: "carrier")
UserShipment.create(user_id: 2, shipment_id: 5, role: "carrier")
UserShipment.create(user_id: 2, shipment_id: 6, role: "carrier")
UserShipment.create(user_id: 2, shipment_id: 7, role: "carrier")
UserShipment.create(user_id: 2, shipment_id: 8, role: "carrier")
UserShipment.create(user_id: 2, shipment_id: 9, role: "carrier")
UserShipment.create(user_id: 2, shipment_id: 10, role: "carrier")
UserShipment.create(user_id: 2, shipment_id: 11, role: "carrier")
# UserShipment.create(user_id: 14, shipment_id: 1, role: "carrier")
# UserShipment.create(user_id: 15, shipment_id: 1, role: "carrier")
# UserShipment.create(user_id: 16, shipment_id: 1, role: "carrier")
# UserShipment.create(user_id: 17, shipment_id: 1, role: "carrier")
# UserShipment.create(user_id: 18, shipment_id: 1, role: "carrier")
# UserShipment.create(user_id: 19, shipment_id: 1, role: "carrier")
# UserShipment.create(user_id: 20, shipment_id: 1, role: "carrier")
#
# Offer.create(user_id: 6, shipment_id: 1,  amount: 1)
# Offer.create(user_id: 7, shipment_id: 1,  amount: 3)
# Offer.create(user_id: 8, shipment_id: 1,  amount: 5)
# Offer.create(user_id: 9, shipment_id: 1,  amount: 7)
# Offer.create(user_id: 10, shipment_id: 1, amount: 9)
# Offer.create(user_id: 11, shipment_id: 1, amount: 11)
# Offer.create(user_id: 12, shipment_id: 1, amount: 13)
# Offer.create(user_id: 13, shipment_id: 1, amount: 15)
# Offer.create(user_id: 14, shipment_id: 1, amount: 14)
# Offer.create(user_id: 15, shipment_id: 1, amount: 12)
# Offer.create(user_id: 16, shipment_id: 1, amount: 10)
# Offer.create(user_id: 17, shipment_id: 1, amount: 8)
# Offer.create(user_id: 18, shipment_id: 1, amount: 6)
# Offer.create(user_id: 19, shipment_id: 1, amount: 4)
# Offer.create(user_id: 20, shipment_id: 1, amount: 2)
