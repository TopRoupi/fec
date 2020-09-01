require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require "view_component/engine"

module Fec
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.action_view.sanitized_allowed_tags = %w[del dd h3 address big sub tt
      a ul h4 cite dfn h5 small kbd code b ins img h6 sup pre strong blockquote
      acronym dt br p div samp li ol var em h1 i abbr h2 span hr table thead tr
      th tbody td]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
