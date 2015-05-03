# Configure Rails Environment
require 'yaml'
ENV["environment"] ||= 'test'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../spec/dummy/config/environment.rb",  __FILE__)
require 'blacklight'

require 'rspec/rails'

RSpec.configure do |config|
  config.mock_with :mocha
  # allows RSpec to set up view/controller helper methods
  config.infer_spec_type_from_file_location!
end

Dir[Pathname.new(File.expand_path("../helpers/**/*.rb", __FILE__))].each {|f| require f}

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
