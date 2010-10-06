#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'haml'

configure do
  enable :run
  set :views, File.dirname(__FILE__) + '/views'
  set :haml, {:format => :html5}
end

get '/' do
  haml :index
end
