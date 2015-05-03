module Dbla::CollectionsHelperBehavior
  def dbla_collection_link(options)
    doc = options[:document]
    type = doc['ingestType']
    title = (type.eql? 'collection') ? doc['sourceResource.title'].first : doc['sourceResource.collection.title'].first
    id = (type.eql? 'collection') ? doc['id'].first : doc['sourceResource.collection.id'].first
    link_to(title, controller: :collections, action: 'show',:id=>id)
  end
  def dbla_collection_search_link(options)
    doc = options[:document]
    type = doc['ingestType']
    title = (type.eql? 'collection') ? doc.fetch('sourceResource.title',[]).first : doc.fetch('sourceResource.collection.title',[]).first
    id = (type.eql? 'collection') ? doc['id'].first : doc.fetch('sourceResource.collection.id',[]).first
    link_to(title, controller: :catalog, action: 'index','f[sourceResource.collection.id][]'=>id,'q'=>'')
  end
end