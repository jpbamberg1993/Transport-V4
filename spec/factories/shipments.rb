FactoryGirl.define do
  factory :shipment do
		origin "Orlando" 
		destination "Boston"
		mode_of_transportation "Full Load"
		equipment_type "Van"
		minimum_commitment 2
		maximum_commitment 5
		cost 50000   
  end
end
