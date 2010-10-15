#!/usr/bin/env ruby
$LOAD_PATH << './lib'
ENV['RACK_ENV'] ||= 'production'

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'
require 'rdiscount'
require 'paginator'
require 'settings'
require 'fixnum'
require 'blog/blog'
require 'blog/blog_post'

configure do	
  enable :run
	set :app, 'kleinmann.org'
  set :views, Settings.app_root + 'views'
  set :public, Settings.app_root + 'public'
  set :server, %w[thin mongrel webrick]
  set :bind, 'localhost'
  
  set :haml, { :format => :html5 }
end

get '/' do
  haml :index
end

get '/impressum' do
  haml :impressum
end

get '/blog/?' do
	redirect '/blog/1'
end

get %r{/blog/(\d+)} do |page|
	blog = Blog.new
	posts = blog.get_all_posts
	
	pager = Paginator.new(posts.size, Settings.posts_per_page) do |offset, per_page|
		posts[offset, per_page]
	end
	@page = pager.page(page)
	
	haml :blog
end

get '/blog/:title' do |title|
	blog = Blog.new
	blogpost = blog.find(title)
	not_found if blogpost == 404
	
	haml :blog_post, :locals => { :blogpost => blogpost }
end

not_found do
  haml :not_found
end

File.open(Settings.app_root + Settings.dir_tmp + '/homepage.pid', 'w') { |f| f.write Process.pid }