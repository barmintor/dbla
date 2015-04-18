= Dbla

Access [DPLA](http://dp.la)'s API via the [Blacklight](http://projectblacklight.org/) search interface.

## Installation

1. Generate a Blacklight app:

```console
$ rails new search_app -m https://raw.github.com/projectblacklight/blacklight/master/template.demo.rb
$ cd search_app
```

2. Add the dbla gem to the Gemfile:

```ruby
gem "dbla"
```
and bundle install.

3. Run the dbla generators:

```console
$ rails g dbla:install
```

4. Create a config/dpla.yml file of the form

```yml
api_key: <your-api-key
api_email: <your-email-that-you-used-for-your-api-key>
url: http://api.dp.la/v2/
```

Find out how to [request your DPLA API key](http://dp.la/info/developers/codex/policies/#get-a-key)

This file can be stubbed out with a rake task:

```console
$ rake dbla:key:get email=my.email@my.server.org
# get your email from DPLA
$ rake dbla:key:config key=YOURKEY00000000
```

5. Configure the CatalogController

Replace the following code in your CatalogController:

```ruby
    # solr field configuration for search results/index views
    config.index.title_field = 'title_display'
    config.index.display_type_field = 'format'
```

With the Dbla options.

```ruby
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

```console
$ rails s
```

Open your browser and go to [localhost:3000](http://localhost:3000).

Search for kittens!