xml.instruct! :xml, :version=>'1.0'
xml.OpenSearchDescription(:xmlns=>'http://a9.com/-/spec/opensearch/1.1/') {
  xml.ShortName application_name
  xml.Description "#{application_name} Search"
  xml.Image "#{asset_url('favicon.ico')}", :height=>16, :width=>16, :type=>'image/x-icon'
  xml.Contact
  xml.Url :type=>'text/html', :method=>'get', :template=>"#{collections_url(:only_path => false)}?q={searchTerms}"
  xml.Url :type=>'application/rss+xml', :method=>'get', :template=>"#{collections_url(format: 'rss', :only_path => false)}?q={searchTerms}"
  xml.Url :type=>'application/x-suggestions+json', :method=>'get', :template=>"#{opensearch_collections_url :format=> 'json', :only_path => false}?q={searchTerms}"
}