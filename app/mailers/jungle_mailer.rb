class JungleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.jungle_mailer.receipt_notification.subject
  #

  default from: 'no-reply@jungle.com'

  def receipt_notification(order)
    @order = order
    mail(to: @order.email, subject: @order.id)
  end
end
