# -*- encoding : utf-8 -*-
module Dbla
  class Response < AbstractResponse
    def initialize(data, request_params, options = {})
      super(force_to_utf8(data))
      @request_params = request_params
      self.document_model = options[:solr_document_model] || options[:document_model] || Item
      self.blacklight_config = options[:blacklight_config]
      # {"count":228,"start":0,"limit":10,"docs"
      @total = data['count']
      @documents = (data['docs'] || []).map {|d| document_model.new(d,self)}
      @start = data['start']
      @limit = data['limit']
    end
  end
end