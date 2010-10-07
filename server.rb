#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'haml'

configure do
  enable :run
  set :views, File.dirname(__FILE__) + '/views'
  set :public, File.dirname(__FILE__) + '/public'
  set :server, %w[thin mongrel webrick]
  set :bind, 'localhost'
  
  set :haml, {:format => :html5}
end

get '/' do
  haml :index
end

get '/impressum' do
  haml :impressum
end