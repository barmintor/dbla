module ActionDispatch::Routing
  class Mapper
    # example
    #   dbla_for :catalog
    #   dbla_for :catalog, constraints: {id: /[0-9]+/ }
    def dbla_for(*resources)
     raise_no_blacklight_secret_key unless Blacklight.secret_key
     Dbla::Routes.for(self, *resources)
    end
    
  end
end