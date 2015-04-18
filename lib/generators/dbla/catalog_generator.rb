# -*- encoding : utf-8 -*-
module Dbla
  class CatalogGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def assets
      copy_file "catalog_controller.rb", "app/controllers/catalog_controller.rb"
    end
  end
end