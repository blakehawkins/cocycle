ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module ActiveSupport
  # Add helper methods to be used by all tests here.
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests alphabetically.
    fixtures :all
  end
end
