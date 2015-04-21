# Configure Rails Environment
require 'yaml'
ENV["environment"] ||= 'test'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../spec/dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'blacklight'
RSpec.configure do |config|
  config.mock_with :mocha
end

def fixtures_path(path)
	path = File.join("..","..","spec","fixtures",path)
	puts path
	path = File.expand_path(path, __FILE__)
	puts path
	path
end

def fixture(path)
	path = fixtures_path(path)
	if block_given?
		open(path) {|b| yield b}
	else
		open(path)
	end
end
