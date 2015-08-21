require 'rails_helper'
require 'user'

Rails.describe User, :type => :model do
	it "Should create company name" do
		mac = User.create!(company_name: 'macen')

		expect(User.company_name).to eq([mac])
	end
end
