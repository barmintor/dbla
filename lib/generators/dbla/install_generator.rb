module Dbla
  class Install < Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)

    argument     :controller_name, type: :string , default: "catalog"
    argument     :search_builder_name, type: :string , default: "search_builder"

    desc """
  This generator makes the following changes to your application:
   1. Generates dbla:models
   3. Creates a stylesheet
   2. Adds Dbla routes to your ./config/routes.rb
         """

    # Copy all files in templates/public/ directory to public/
    # Call external generator in AssetsGenerator, so we can
    # leave that callable seperately too.
    def copy_public_assets
      generate "dbla:assets"
    end

    def generate_search_builder
      generate 'dbla:search_builder', search_builder_name
    end

    def generate_dbla_models
      generate 'dbla:models'
    end

    def generate_dbla_routes
      generate 'dbla:routes'
    end
  end
end
