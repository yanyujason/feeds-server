ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # teardown :clean_db
  #
  # def clean_db
  #   Rake::Task['db:mongoid:purge'].invoke
  #   Rake::Task['db:mongoid:drop'].invoke
  # end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end
