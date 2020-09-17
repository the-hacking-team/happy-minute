class OwnerMailer < ApplicationMailer
  def welcome_email
    @owner = params[:owner]
    if Truemail.validate(@owner.email).result.success
    mail(to: @owner.email, subject: 'Bienvenue parmi nous')
	end
  end
end
