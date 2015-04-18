# -*- encoding : utf-8 -*-
require 'net/http'
module Dbla
  module ApiKey
    RESOURCE = 'http://api.dp.la/v2/api_key/'.freeze
    USAGE = {
      get:    "       rake Dbla:key:get email=YOUR.EMAIL@SERVER.ORG",
      config: "       rake Dbla:key:config key=YOURKEY000000000000000000000000",
      report: "       rake Dbla:key:report",
    }
    def self.usage(key=:all)
      puts "Usage:"
      USAGE.select {|k,v| k == key || key == :all}.each{|k,v| puts v} 
    end
  end
end
namespace :dbla do
  namespace :key do
    task get: :environment do
      if ENV['email']
        uri = URI(RESOURCE + email)
        Net::HTTP.start(uri.host, uri.port) do |http|
          request = Net::HTTP::Post.new uri
          response = http.request request
          puts response.body
          puts "after receiving your api key run:"
          Dbla::ApiKey.usage(:config)
          open(Dbla.config_path,'w') do |blob|
            blob.write YAML.dump('api_email' => ENV['email'],'url' =>'http://api.dp.la/v2/')
          end
        end
      else
        Dbla::ApiKey.usage(:get)
      end
    end
    task report: :environment do
      if File.exists? Dbla.config_path
        Dbla.config.each {|k,v| puts "#{k}: #{v}"}
      else
        puts "no config found at #{Dbla.config_path}"
        Dbla::ApiKey.usage(:report)
      end
    end
    task config: :environment do
      if ENV['key']
          open(Dbla.config_path,'a') do |blob|
            blob.write YAML.dump('api_key' => ENV['key'])
          end
      else
        Dbla::ApiKey.usage(:config)
      end
    end
    task usage: :environment do
      Dbla::ApiKey.usage
    end
  end
end