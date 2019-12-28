ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors)
  include FactoryBot::Syntax::Methods
  include Devise::Test::IntegrationHelpers
end

class ActionController::TestCase
  Devise::Test::ControllerHelpers
end
