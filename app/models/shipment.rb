class Shipment < ActiveRecord::Base
  belongs_to :user
  has_many :offers, dependent: :destroy

  validates :user, presence: :true

  validates :origin, presence: :true
  validates :destination, presence: :true
  validates :mode_of_transportation, presence: :true
  validates :equipment_type, presence: :true
  validates :minimum_commitment, presence: :true
  validates :maximum_commitment, presence: :true
  validates :cost, presence: :true

	def formatted_price
		price_in_dollars = price_in_cents.to_f / 100
		sprintf("%.2f", price_in_dollars)
	end

  scope :owned, ->  { where( user_id: @current_user.id) }

  #scope :invited_to, -> { where()}
end

# 1. create new controller action and use that for the admin view
# 2. use existing controller figure out current user then create instance variable with offers if current use owns shipment
