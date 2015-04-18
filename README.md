= Dbla

1. Generate a Blacklight app:
```
rails new search_app -m https://raw.github.com/projectblacklight/blacklight/master/template.demo.rb
cd search_app
```

2. Add the dbla gem to the Gemfile:
```
gem "dbla"
```
and bundle install.

3. Run the dbla generators:
```
rails g dbla:install
```

4. Create a config/dpla.yml file of the form:
```
api_key: 00000000
api_email: ab@dp.la
url: http://api.dp.la/v2/
```
This file can be stubbed out with a rake task:
```
rake dbla:key:get email=my.email@my.server.org
# get your email
rake dbla:key:config key=YOURKEY00000000
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

Search for kittens!