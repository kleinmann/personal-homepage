namespace :thin do
	tmp_dir = Settings.app_root + Settings.dir_tmp
	desc "Starts thin to serve kleinmann.org"
	task :start do
		Dir.mkdir(tmp_dir) unless File.directory? tmp_dir
		system 'nohup ' + Settings.app_root + 'server.rb > /dev/null &'
		puts 'kleinmann.org is up & running with environment ' + ENV['RACK_ENV']
	end

	desc "Shut down kleinmann.org by stopping thin"
	task :stop do
		if File.file? tmp_dir + '/homepage.pid'
			system 'kill `cat ' + File.dirname(__FILE__) + 
'/../../tmp/homepage.pid`'
			system 'rm ' + tmp_dir + '/homepage.pid'
			puts 'kleinmann.org has been shut down'
		else
			puts 'kleinmann.org is not running or pid-file is missing.'
		end
	end
end
