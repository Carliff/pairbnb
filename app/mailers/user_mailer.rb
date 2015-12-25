class UserMailer < ApplicationMailer
	default from: "info@impactaa.com"

	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to PairBnB')
	end
end
