# Not sure might be class ExampleMailer < ApplicationMailer::Base
class ExampleMailer < ActionMailer::Base
	default from: "jpbamberg1993@gmail.com"

# might pass users
	def sample_email(user)
		@user = user
		mail(to: @user.email, subject: 'FUCKING SHITTT!!!')
	end
end
