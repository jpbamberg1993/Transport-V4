class User < ActiveRecord::Base
  has_many :shipments, through: :user_shipments
  has_many :user_shipments
  has_many :offers, dependent: :destroy

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

  # => Methods to help testing seeds in console - Chris
  # => Remove before finishing
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

end
