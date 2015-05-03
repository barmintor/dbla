# -*- encoding : utf-8 -*-
module Dbla
  class Routes < Blacklight::Routes

    def self.for(router, *resources)
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

        get "items/opensearch", :as => "opensearch_items", :to => "#{primary_resource}#opensearch"
        resources :items, args.merge(controller: primary_resource) do
          member do
            post "track"
          end
        end
      end
    end

    def collection_routing(primary_resource)
      add_routes do |options|
        args = {}
        args[:constraints] = options[:constraints] if options[:constraints]

        get "collections/opensearch", :as => "opensearch_collections", :to => "collections#opensearch"
        resources :collections, args do
          member do
            post "track"
          end
        end
      end
    end
  end
end