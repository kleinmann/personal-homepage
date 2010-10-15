$LOAD_PATH << './lib'
ENV['RACK_ENV'] ||= 'production'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'settings'

Dir[Settings.app_root + "/lib/tasks/**/*.rake"].sort.each { |ext| load ext }
