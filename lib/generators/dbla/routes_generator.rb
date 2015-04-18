module Dbla
  class RoutesGenerator < Rails::Generators::Base
    
    source_root File.expand_path('../templates', __FILE__)
    
    argument     :controller_name  , type: :string , default: "catalog"

    desc """
  This generator makes the following changes to your application:
   1. Adds routes for your controller
         """

    def inject_blacklight_routes
      # These will end up in routes.rb file in reverse order
      # we add em, since each is added at the top of file. 
      # we want "root" to be FIRST for optimal url generation. 
      route("Dbla::Routes.for(self, :#{controller_name})")
    end
  end
end