namespace :thin do
	tmp_dir = File.dirname(__FILE__) + '/../../tmp'
	desc "Start thin to serve the page"
	task :start do
		Dir.mkdir(tmp_dir) unless File.directory? tmp_dir
		system 'nohup ' + File.dirname(__FILE__) + '/../../server.rb > /dev/null &'
	end

	desc "Stop thin"
	task :stop do
		if File.file? tmp_dir + '/homepage.pid'
			system 'kill `cat ' + File.dirname(__FILE__) + 
'/../../tmp/homepage.pid`'
			system 'rm ' + tmp_dir + '/homepage.pid'
		else
			puts 'App is not running or pid-file is missing.'
		end
	end
end
