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

  # def shipper?(current_user)
  #   current_user.role == "shipper"
  # end

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

end
