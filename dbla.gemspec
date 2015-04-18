$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dbla/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dbla"
  s.version     = Dbla::VERSION
  s.authors     = ["Audrey Altman","Ben Armintor"]
  s.email       = ["audrey@dp.la", "armintor@gmail.com"]
  s.homepage    = "https://github.com/barmintor/dbla"
  s.summary     = "Rails engine to put BL on DPLA"
  s.description = "Rails engine to put BL on DPLA -> DBLA"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.10"
  s.add_dependency "blacklight", "~> 5.10"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'mocha'
end
