module Dbla
  class Engine < ::Rails::Engine
    isolate_namespace Dbla
    require 'dbla/rails/routes'
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
  end
end
