require "dbla/engine"

module Dbla
  def self.config_path
    @config_path ||= File.join(Rails.root,'config','dpla.yml').freeze
  end
  def self.config
    @config ||= YAML.load(File.read(config_path)).symbolize_keys
  end
  autoload :AbstractResponse, 'dbla/abstract_response'
  autoload :DocumentPresenter, 'dbla/document_presenter'
  autoload :Repository, 'dbla/repository'
  autoload :Response, 'dbla/response'
  autoload :Routes, 'dbla/routes'
end
