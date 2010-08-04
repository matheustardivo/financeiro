class Notifier < ActionMailer::Base
  default_url_options[:host] = "financeiro.tardivo.org"

  def password_reset_instructions(user)
    subject "Instruções para resetar sua senha"
    from "noreply@tardivo.org"
    recipients user.email
    sent_on Time.now
    body :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end
end
