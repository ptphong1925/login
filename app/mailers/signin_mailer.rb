class SigninMailer < ApplicationMailer
  def new_signin(user)
    @user = user
    mail(to: @user.email, subject: "You signin successfully")
  end
end
