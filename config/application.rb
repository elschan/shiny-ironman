require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module ShinyIronman
  class Application < Rails::Application
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

   # unless Rails.env.development?
        config.action_mailer.smtp_settings = {
            :address => "smtp.mandrillapp.com",
            :port => 25,
            :enable_starttles_auto => true,
            :user_name => ENV['shine_email'],
            :password => ENV['MANDRILL_API_KEY'],
            :domain => 'www.theshinecode.com'
        }
   # end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
