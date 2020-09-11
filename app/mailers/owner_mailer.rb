# frozen_string_literal: true

class OwnerMailer < ApplicationMailer
  def welcome_email
    @owner = params[:owner]
    mail(to: @owner.email, subject: 'Bienvenue parmi nous')
  end
end
