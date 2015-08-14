class Shipment < ActiveRecord::Base
  belongs_to :user
  has_many :offers

  validates :offer, :user, presence: :true
  # Need to add value validation

	def formatted_price 
		price_in_dollars = price_in_cents.to_f / 100 
		sprintf("%.2f", price_in_dollars)
	end
end

# 1. create new controller action and use that for the admin view
# 2. use existing controller figure out current user then create instance variable with offers if current use owns shipment


















