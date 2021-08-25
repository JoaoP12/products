class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user

    mail(
      to: user.email, 
      subject: "Password Reset",
      from: "no-replay@agenciaw3.digital"
    ) 
  end

  def registration_confirmation(user)
    @user = user

    mail(
      to: user.email,
      subject: "Confirm your account",
      from: "no-replay@agenciaw3.digital"
    )
  end
end
