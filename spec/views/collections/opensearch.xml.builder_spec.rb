require 'spec_helper'

describe 'collections/opensearch.xml.builder' do

  let(:url_helpers) do
    Blacklight.secret_key ||= '#{SecureRandom.hex(64)}'
    Dbla::Engine.routes.draw do
      dbla_for :catalog
    end
    Dbla::Engine.routes.url_helpers
  end
  before do
    view.extend url_helpers
  end
  it "should render an OpenSearch description document" do
    include url_helpers
    render
    doc = Nokogiri::XML.parse(rendered)
    doc.remove_namespaces!
    expect(doc.xpath('/OpenSearchDescription').length).to eq 1
  end
end