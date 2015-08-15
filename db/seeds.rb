# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create( id: 1, email: "chrisalan313@gmail.com", password: "password", company_name: "Company 1" )

User.create( id: 2, email: "example@example.com", password: "password", company_name: "Company 2")

Shipment.create( id: 4, origin: "Here", destination: "There", mode_of_transportation: "Something", equipment_type: "Something", minimum_commitment: 1, maximum_commitment: 2, cost: 2222, user_id: 1 )

Offer.create( id: 2, amount: 222222, user_id: 2, shipment_id: 4 )
