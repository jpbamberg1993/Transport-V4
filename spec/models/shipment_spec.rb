require 'rails_helper'

describe Shipment do 
	
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

	# insures instantiation
	describe 'instantiation' do
		let!(:shipment) { build(:shipment) }

		it 'instantiates a shipment' do
			expect(shipment.class.name).to eq("Shipment")
		end
	end

	

end
