class OwnerMailer < ApplicationMailer
  def welcome_email
    @owner = params[:owner]
    puts '$*' * 50
    puts smtp_settings
    mail(to: @owner.email, subject: 'Bienvenue parmi nous')
  end
end
