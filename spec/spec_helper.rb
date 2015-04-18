# Configure Rails Environment
require 'yaml'
ENV["environment"] ||= 'test'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../spec/dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'

RSpec.configure do |config|
  config.mock_with :mocha
end

