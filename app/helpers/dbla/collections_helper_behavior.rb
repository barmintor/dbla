module Dbla::CollectionsHelperBehavior
  def collection_search_link(options, text='Collection Members')
  	id = options[:value]
    link_to(text, controller: :catalog, action: 'index','f[sourceResource.collection.id][]'=>id,'q'=>'')
  end
end