class UserMailerController < ApplicationController
	
	def create
		UserMailer.example(User.new(email: 'jpbamberg1993@gmail.com')).deliver
		@user = User.all
	end

end
