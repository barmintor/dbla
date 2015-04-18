require 'rails/generators'

module Dbla
  class ModelsGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    desc """
This generator makes the following changes to your application:
 1. Creates the Item and Collection in your /app/models directory
"""
    def create_models
      template "item.rb", "app/models/item.rb"
      template "collection.rb", "app/models/collection.rb"
    end

  end
end