class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :shipment, touch: true

  # => amount: integer
  validates :amount, presence: true, numericality: { only_integer: true }
  # => user_id: integer
  validates :user_id, presence: true
  validates_associated :user
  # => shipment_id: integer
  validates :shipment_id, presence: true
  validates_associated :shipment

  def company
    User.find_by(id: self.user_id).company_name
  end

  def self.list_for_this_shipment(id)
    Offer.where(shipment_id: id)
  end

  def set_user(user)
    self.user_id = user.id
  end

end
