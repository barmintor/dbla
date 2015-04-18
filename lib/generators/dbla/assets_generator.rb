# -*- encoding : utf-8 -*-
module Dbla
  class Assets < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def assets
      copy_file "dbla.css.scss", "app/assets/stylesheets/dbla.css.scss"
    end
  end
end