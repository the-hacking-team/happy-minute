class OwnerMailer < ApplicationMailer
  def welcome_email
    @owner = params[:order]
    mail(to: @owner.email, subject: 'Bienvenue parmi nous')
  end
end
