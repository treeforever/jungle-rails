class JungleMailerPreview < ActionMailer::Preview
  def receipt_mail_preview
    @order = Order.last
    JungleMailer.receipt_notification(@order)
  end
end
