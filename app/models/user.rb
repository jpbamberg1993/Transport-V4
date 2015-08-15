class User < ActiveRecord::Base
  has_many :shipments
  has_many :offers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # => Email, Password Already Validated
  # validates :company_name, presence: true

end
