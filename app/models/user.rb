class User < ActiveRecord::Base
  has_many :shipments, dependent: :destroy
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

end
