# -*- encoding : utf-8 -*-
module Dbla
  class Routes < Blacklight::Routes

    def self.for(router, *resources)
        raise_no_blacklight_secret_key unless Blacklight.secret_key
        options = resources.extract_options!
        resources.map!(&:to_sym)

        Dbla::Routes.new(router, options.merge(resources: resources)).draw
    end

    def draw
      item_routing(primary_resource)
      collection_routing(primary_resource)
    end

    def item_routing(primary_resource)
      add_routes do |options|
        args = {only: [:show]}
        args[:constraints] = options[:constraints] if options[:constraints]

        resources :item, args.merge(path: primary_resource, controller: primary_resource) do
          member do
            post "track"
          end
        end
      end
    end

    def collection_routing(primary_resource)
      add_routes do |options|
        args = {only: [:show]}
        args[:constraints] = options[:constraints] if options[:constraints]

        resources :collection, args.merge(path: primary_resource, controller: primary_resource) do
          member do
            post "track"
          end
        end
      end
    end
  end
end