# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require "view_component/engine"

module Fec
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.action_view.sanitized_allowed_tags = %w[del dd h3 address big sub tt
      a ul h4 cite dfn h5 small kbd code b ins img h6 sup pre strong blockquote
      acronym dt br p div samp li ol var em h1 i abbr h2 span hr table thead tr
      th tbody td]

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
