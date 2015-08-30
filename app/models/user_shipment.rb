class UserShipment < ActiveRecord::Base
  belongs_to :user
  belongs_to :shipment
  after_create :send_carrier_email

	# send a signup email to the user, pass in the user object that   contains the user's email address
	# def send_signup_email(user)
	#   @user = user
	#   mail( :to => @user.email,
	#    :subject => 'Thanks for signing up for our amazing app' )
	# end
	
	private 
	def send_carrier_email
		if self.role == "carrier"
			UserNotifier.send_signup_email(self.user).deliver_now
		end
	end
end
