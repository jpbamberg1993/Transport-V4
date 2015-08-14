class Offer < ActiveRecord::Base
  # => amount: integer
  validates :amount, presence: true, numericality: { only_integer: true }
  # => user_id: integer
  validates :user_id, presence: true
  validates_associated :user
  # => shipment_id: integer
  validates :shipment_id, presence: true
  validates_associated :shipment

  belongs_to :user
  belongs_to :shipment
end
