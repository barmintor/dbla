# -*- encoding : utf-8 -*-
module Dbla
  class HelperGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def assets
      copy_file "dbla_helper.rb", "app/helpers/dbla_helper.rb"
    end
  end
end