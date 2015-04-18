# -*- encoding : utf-8 -*-
module Dbla
  class AbstractResponse < HashWithIndifferentAccess
    require  'blacklight/solr_response/pagination_methods'
    include Blacklight::SolrResponse::PaginationMethods
    # secret api
    attr_accessor :document_model, :blacklight_config, :total, :documents, :start, :limit, :request_params

    def header
      self['responseHeader'] || {}
    end

    def params
      header['params'] || request_params
    end

    def start
      @start
    end

    def rows
      @limit
    end

    def sort
      params[:sort]
    end

    # Facets are built from this method's output
    def aggregations
      {}
    end
    # secret api
    def export_formats
      {}
    end

    def grouped?
      false
    end

    def more_like(doc)
      []
    end

    private

    # borrowed from Blacklight::SolrRepository
    def force_to_utf8(value)
      case value
      when Hash
        value.each { |k, v| value[k] = force_to_utf8(v) }
      when Array
        value.each { |v| force_to_utf8(v) }
      when String
        value.force_encoding("utf-8")  if value.respond_to?(:force_encoding)
      end
      value
    end

  end
end
