module Dbla
  class Repository < Blacklight::AbstractRepository
    extend Deprecation
    self.deprecation_horizon = 'blacklight 6.0'

    def find id, params = {}
      data = get("#{url}/#{id}?api_key=#{api_key}")
      Response.new(data, params,{})
    end

    def search params = {}
      data = nil
      #TODO Move this into a SearchBuilder, add a generator
      if params['q']
        q = "?api_key=#{api_key}&q=#{params['q']}&facets=sourceResource.format"
        if params.page
          q << "&page=#{params.page}"
        end
        if params.rows
          q << "&page_size=#{params.rows}"
        end
        params.facet_filters do |facet_field, value|
          q << "&#{facet_field}=#{CGI::escape(value)}"
        end
        puts url + q
        data = get(url + q)
      end
      Response.new(data, params,{})
    end

    def get(uri)
      uri = URI(uri)
      Net::HTTP.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Get.new uri
        response = http.request request
        return JSON.parse(response.body)
      end
    end
    def api_key
      Dbla.config.fetch(:api_key)
    end

    def url
      # REVIEW: What if the URL does not have a trailing /; Should it be `File.join?`
      @url ||= (Dbla.config.fetch(:url) + blacklight_config.document_model.name.downcase.pluralize).freeze
    end

  end
end
