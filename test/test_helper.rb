# frozen_string_literal: true

require "simplecov"
SimpleCov.start "rails"

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

require "minitest/autorun"
require "shoulda/context"

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors)
  include FactoryBot::Syntax::Methods
  include Devise::Test::IntegrationHelpers

  Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }
end

class ActionController::TestCase
  Devise::Test::ControllerHelpers
end
