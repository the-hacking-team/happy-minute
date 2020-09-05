class ApplicationMailer < ActionMailer::Base
  default from: ENV['HAPPY_MINUTE_FROM']
  layout 'mailer'
end
