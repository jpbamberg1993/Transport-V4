class Shipment < ActiveRecord::Base
  has_many :users, through: :user_shipments
  has_many :user_shipments
  has_many :offers
  # => Destroy associated user_shipments and offers upon being destroyed
  before_destroy :clean_database

  accepts_nested_attributes_for :user_shipments

  validates :origin, presence: :true
  validates :destination, presence: :true
  validates :mode_of_transportation, presence: :true
  validates :equipment_type, presence: :true
  validates :minimum_commitment, presence: :true
  validates :maximum_commitment, presence: :true
  validates :cost, presence: :true

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

  def carriers_not_added
    all = User.where(role: 'carrier')
    added = user_shipments.where(role: 'carrier', ).map(&:user)
    return ( all - added )
  end

  def has_offer?(user)
    shipment = self
    offer = Offer.where( user_id: user.id, shipment_id: shipment.id )

    if offer.empty?
      return false
    else
      return true
    end
  end

  def user_offer(user)
    shipment = self
    offer = Offer.where( user_id: user.id, shipment_id: shipment.id ).take
    offer.amount
  end

  def set_offer(user)
    shipment = self
    offer = Offer.where( user_id: user.id, shipment_id: shipment.id ).take
  end

  # Defines columns from database to download to csv
  def self.to_csv(attributes = column_names, options = {})
    CSV.generate(options) do |csv|
      csv.add_row(["origin", "destination", "mode_of_transportation", "equipment_type", "minimum_commitment", "maximum_commitment", "cost"])
      all.each do |foo|
        values = foo.attributes.slice("origin", "destination", "mode_of_transportation", "equipment_type", "minimum_commitment", "maximum_commitment", "cost").values
        csv.add_row values
      end
    end
  end

  def create_user_shipment_collection(carrier_ids)
    #if carrier_ids

    result = []

    carrier_ids.each do |id|
      new_user_shipment = self.user_shipments.new(user_id: id, role: "carrier")

      if new_user_shipment.save
        result << new_user_shipment
      else
        result << "#{new_user_shipment.user.company_name} was not saved"
      end
    end
    return result
    # => Needs something to display errors in
    # => user_shipment creation in a helpful way for users
    #end
  end

  def formatted_price
    price_in_dollars = cost.to_f
    format("%.2f", price_in_dollars)
  end

  protected

  def clean_database
    self.user_shipments.destroy
    self.offers.destroy
  end

end
