require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TOPRailsFlightBooker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # config for setting local time zone; did not hold as app was deployed to heroku.
    # Went with Time.zone.local to seed db flight departure times.

    # config.active_record.default_timezone = :local
    # config.time_zone = 'Eastern Time (US & Canada)'
  end
end
