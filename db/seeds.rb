# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

wyncode = User.create( company_name: "Wyncode" )
juvenal = User.create( company_name: "Juvenal" )

shipment = Shipment.create( start_point: "FL", end_point: "GA", user_id: wyncode.id )

Offer.create( amount: 10000, user_id: juvenal.id, shipment_id: shipment.id )
