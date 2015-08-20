require 'rails_helper'

describe Shipment do 
	let(:valid_attributes) {{		
														origin => "Orlando",
														destination => "Boston",
														mode_of_transportation => "Full Load",
														equipment_type => "Van",
														minimum_commitment=>  2,
														maximum_commitment=>  5,
														cost=>  50000 
														}}
	it 'creates a shipment with valid attributes' do
		 shipment = create(:shipment)
		 expect(shipment).to be_valid
	end
	it 'creates a shipment with valid attributes' do
		 shipment = create(:shipment{origin: ""})
		 expect(shipment).to be_invalid
	end
	# it 'can not create a shipment with missing attributes'
	# it 'has many offers'
	# it 'has user'
	# it 'invalid without origin'
	# it 'invalid without destination'
	
end