class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail(
      from: ENV['SMTP_USERNAME'],
      to: ENV['TOMAIL'],
      subject: 'お問い合わせ通知'
    )
  end
end
