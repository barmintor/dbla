module Dbla
  class DocumentPresenter < Blacklight::DocumentPresenter
    include ActionView::Helpers::OutputSafetyHelper
    include ActionView::Helpers::TagHelper
    extend Deprecation

    DESCRIPTIVE_METADATA_KEY = 'sourceResource'.freeze

    # @param [Item or Collection] document
    # @param [ActionController::Base] controller scope for linking and generating urls
    # @param [Blacklight::Configuration] configuration
    def initialize(document, controller, configuration = controller.blacklight_config)
      @document = document
      @configuration = configuration
      @controller = controller
    end
    def source_resource_title
      @document[DESCRIPTIVE_METADATA_KEY] ? (@document[DESCRIPTIVE_METADATA_KEY]['title'] || @document['id']) : @document['id']
    end
    ##
    # Get the value of the document's "title" field, or a placeholder
    # value (if empty)
    #
    # @param [SolrDocument] document
    # @return [String]
    def document_heading
      source_resource_title
    end
    ##
    # Get the document's "title" to display in the <title> element.
    # (by default, use the #document_heading)
    #
    # @see #document_heading
    # @return [String]
    def document_show_html_title
      source_resource_title
    end
    ##
    # Render a value (or array of values) from a field
    #
    # @param [String] value or list of values to display
    # @param [Blacklight::Solr::Configuration::Field] solr field configuration
    # @return [String]
    def render_field_value value=nil, field_config=nil
        super
    end
    ##
    # Render the document index heading
    #
    # @param [Hash] opts (Deprecated)
    # @option opts [Symbol] :label Render the given field from the document
    # @option opts [Proc] :label Evaluate the given proc
    # @option opts [String] :label Render the given string
    # @param [Symbol, Proc, String] field Render the given field or evaluate the proc or render the given string
    def render_document_index_label field, opts ={}
      super
    end
    ##
    # Render the index field label for a document
    #
    #   Allow an extention point where information in the document
    #   may drive the value of the field
    #   @param [String] field
    #   @param [Hash] opts
    #   @options opts [String] :value
    def render_index_field_value field, options = {}
        super
    end
    ##
    # Render the show field value for a document
    #
    #   Allow an extention point where information in the document
    #   may drive the value of the field
    #   @param [String] field
    #   @param [Hash] options
    #   @options opts [String] :value
    def render_document_show_field_value field, options={}
        super
    end

    ##
    # Get the value for a document's field, and prepare to render it.
    # - highlight_field
    # - accessor
    # - solr field
    #
    # Rendering:
    #   - helper_method
    #   - link_to_search
    # TODO : maybe this should be merged with render_field_value, and the ugly signature
    # simplified by pushing some of this logic into the "model"
    # @param [SolrDocument] document
    # @param [String] field name
    # @param [Blacklight::Solr::Configuration::Field] solr field configuration
    # @param [Hash] options additional options to pass to the rendering helpers
    def get_field_values field, field_config, options = {}
        super
    end

    ##
    # Default separator to use in #render_field_value
    #
    # @return [String]
    def field_value_separator
      ', '
    end




  end
end
