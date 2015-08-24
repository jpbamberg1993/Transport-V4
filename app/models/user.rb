class User < ActiveRecord::Base
  has_many :shipments, through: :user_shipments
  has_many :user_shipments
  has_many :offers
  # => Deletes user's user_shipments and
  # => if shipper, shipments and if carrier, offers
  before_destroy :clean_database

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # => Email, Password Already Validated
  validates :company_name, presence: true
  validates :role, presence: true

  def self.list_carriers
    self.where(role: 'carrier')
  end

  def posted_shipments
    user_shipments.where(role: 'shipper').map(&:shipment)
  end

  def carrier_shipments
    user_shipments.where(role: 'carrier').map(&:shipment)
  end

  def shipper?
    self.role == "shipper"
  end

  def carrier?
    self.role == "carrier"
  end

  def offer_made
    offer = self.offers
    if offer
      return "No Offer Submitted"
    else
      return offer.amount
    end
  end

  # => Methods to help testing seeds in console - Chris
  # => Remove before finishing

  # => Enter this in the console for easier testing
  # => ActiveRecord::Base.logger.level = 1
  def self.see_id_and_roles
    self.all.each do |u|
      puts "================="
      puts "id: #{u.id}"
      puts "name: #{u.company_name}"
    end
  end

  # => To see shipments that each carrier can view
  def self.see_carrier_shipments
    self.where(role: 'carrier').each do |u|
      puts "==================================="
      puts "id: #{u.id}"
      puts "#{u.company_name}"
      puts "#{u.shipments.count} shipments"
      if u.shipments.count > 0
        u.shipments.each do |s|
          puts "Name: #{s.shipper.company_name}"
          puts "id: #{s.shipper.id}"
        end
      end
    end
  end

  protected

  def clean_database
    if self.shipper?
      self.shipments.destroy
    else
      self.offers.destroy
    end
    self.user_shipments.destroy
  end

end
