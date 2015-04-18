= Dbla

1. Generate a Blacklight app:
```
rails new search_app -m https://raw.github.com/projectblacklight/blacklight/master/template.demo.rb
cd search_app
```

2. Add the dbla gem:
```
TODO
```

3. Run the dbla generators:
```
```

4. Create a config/dpla.yml file of the form:
```
api_key: 00000000
api_email: ab@dp.la
url: http://api.dp.la/v2/
```

5. Configure the CatalogController
```
    config.repository_class = Dbla::Repository
    config.document_model = Item
    config.response_model = Dbla::Response
    config.document_presenter_class = Dbla::DocumentPresenter
    # solr field configuration for search results/index views
    config.index.title_field = 'sourceResource/title'
    config.index.thumbnail_field = 'object'
    config.index.display_type_field = 'format'
```

6. Fire it up!
``` rails s```

Go to localhost:3000