FactoryGirl.define do
  factory :user do
		email "mac@example.com"
		encrypted_password "password"
		company_name "mac"
		role "shipper"
  end
end
