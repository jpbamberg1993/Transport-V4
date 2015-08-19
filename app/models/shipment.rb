class Shipment < ActiveRecord::Base
  has_many :users, through: :user_shipments
  has_many :user_shipments
  has_many :offers, dependent: :destroy


  validates :user_id, presence: :true

  validates :origin, presence: :true
  validates :destination, presence: :true
  validates :mode_of_transportation, presence: :true
  validates :equipment_type, presence: :true
  validates :minimum_commitment, presence: :true
  validates :maximum_commitment, presence: :true
  validates :cost, presence: :true
  # validates :price_in_cents, numericality: {only_integer: true, greater_than: 0}

  def shippers
    user_shipments.where(role: 'shipper').map(&:user)
  end

  def carriers
    user_shipments.where(role: 'carrier').map(&:user)
  end

  def formatted_price
    price_in_dollars = cost.to_f
    format("%.2f", price_in_dollars)
  end

end
