module Dbla
  module SearchBuilderBehavior
    def processed_parameters
      request.tap do |request_parameters|
        if blacklight_params[:q] || blacklight_params[:f]
          request_parameters[:q] = blacklight_params.fetch(:q,'')
        end
      end
    end
    def facet_filters
      # :fq, map from :f.
      if ( blacklight_params[:f])
        f_request_params = blacklight_params[:f]

        f_request_params.each_pair do |facet_field, value_list|
          Array(value_list).each do |value|
            next if value.blank? # skip empty strings
            yield *[facet_field, value]
          end
        end
      end
    end
  end
end