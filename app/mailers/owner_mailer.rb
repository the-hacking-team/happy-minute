class OwnerMailer < ApplicationMailer
  def welcome_email
    @owner = params[:owner]
    @email = ENV['HAPPY_MINUTE_FROM']
    @url   = ENV['HAPPY_MINUTE_HOSTNAME']
    mail(to: @owner.email, subject: 'Bienvenue chez Happy Minute !')
  end
end
