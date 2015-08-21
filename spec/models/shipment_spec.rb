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
	# Checks shipment is created
	it 'creates a shipment with valid attributes' do
		 shipment = create(:shipment)
		 expect(shipment).to be_valid
	end
	# Checks Origin field is present and if not fails
	it 'creates a shipment with in_valid attributes' do
	 	shipment = create(:shipment)
	 	shipment.origin = nil
	 	expect(shipment).to be_invalid
	end
	
end
