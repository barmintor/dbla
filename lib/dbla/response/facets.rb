require 'ostruct'
module Dbla::Response::Facets
  # Borrowed from Blacklight
  class FacetField
    attr_reader :name, :items
    def initialize name, items, options = {}
      @name, @items = name, items
      @options = options
    end

    def limit
      @options[:limit] || default_limit
    end

    def sort
      @options[:sort] || default_sort
    end

    def offset
      @options[:offset] || default_offset
    end

    private
    def default_limit
      100
    end

    def default_sort
      if limit > 0
        'count'
      else
        'index'
      end
    end

    def default_offset
      0
    end
  end
  class FacetItem < OpenStruct
    def initialize *args
      options = args.extract_options!

      # Backwards-compat method signature
      value = args.shift
      hits = args.shift

      options[:value] = value if value
      options[:hits] = hits if hits

      super(options)
    end

    def label
      super || value
    end

    def as_json(props = nil)
      table.as_json(props)
    end
  end
end
