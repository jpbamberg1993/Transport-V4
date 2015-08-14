class Shipment < ActiveRecord::Base
  belongs_to :user
  has_many :offers

  # def self.can_edit?(@current_user)
  #   if ( @current_user == @shipment.user )
  #
  #   end
  # end
end
