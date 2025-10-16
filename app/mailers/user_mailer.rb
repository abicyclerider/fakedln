class UserMailer < ApplicationMailer
  default from: 'noreply@fakedln.com'

  def welcome_email(user)
    @user = user
    @url = root_url
    mail(to: @user.email, subject: 'Welcome to FakeDLN!')
  end
end
