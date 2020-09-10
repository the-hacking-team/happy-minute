class CustomerMailer < ApplicationMailer

  def welcome_email
    @customer = params[:customer]
    mail(to: @customer.email, subject: 'Bienvenue parmi nous')
  end

end
