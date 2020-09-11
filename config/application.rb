# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HappyMinute
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # IONOS SMTP settings
    config.action_mailer.smtp_settings = {
      address: 'auth.smtp.1and1.co.uk',
      port: 587,
      domain: 'happy-minute.com',
      user_name: ENV['IONOS_SMTP_USERNAME'],
      password: ENV['IONOS_SMTP_PASSWORD'],
      authentication: 'login'
    }

    # Timezone
    config.time_zone = 'Europe/Paris'
  end
end
