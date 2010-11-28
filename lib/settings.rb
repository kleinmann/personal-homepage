require 'settingslogic'

class Settings < Settingslogic
	source File.dirname(__FILE__) + '/../config/settings.yml'
	namespace ENV['RACK_ENV']
	load!
end
