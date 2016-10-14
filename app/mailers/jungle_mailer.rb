class JungleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.jungle_mailer.receipt_notification.subject
  #

  default from: 'no-reply@jungle.com'

  def receipt_notification(user)
    @greeting = "Hi"
    @user = user
    mail(to: @user.email, subject:"Order confirmation" + @user.order.id)
  end
end
