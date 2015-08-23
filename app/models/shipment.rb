class Shipment < ActiveRecord::Base
  has_many :users, through: :user_shipments
  has_many :user_shipments, dependent: :destroy
  has_many :offers, dependent: :destroy

  accepts_nested_attributes_for :user_shipments

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

  def shipper
    user_shipments.where(role: 'shipper').map(&:user)[0]
  end

  def company_name
    user_shipments.where(role: 'shipper').map(&:user)[0].company_name
  end

  def carriers
    user_shipments.where(role: 'carrier').map(&:user)
  end

  def formatted_price
    price_in_dollars = cost.to_f
    format("%.2f", price_in_dollars)
  end
end
