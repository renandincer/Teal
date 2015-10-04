require 'rubygems'
require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require 'sinatra/base'
require 'mongo'
include Mongo

# require models
# require_relative 'models/episode'
require_relative 'models/base'
require_relative 'models/program'
require_relative 'api_program'

module Teal
  class App < Sinatra::Base
    # make everything be a json response (callback to every route)
    before do
      content_type 'application/json'
    end

  	# root route responds with a cool string
    get '/' do
    	content_type :json
    	info = {
    		"about" => "Teal is WJRH's DJ-Program-Episode management API",
    		"documentation" => "github.com/wjrh/Teal",
    		"contact" => "wjrh@lafayette.edu",
    		"authors" => ["Renan Dincer"] #add your name here if you're contributing.
    	}
    	JSON.pretty_generate(info)
    end
  end
end
