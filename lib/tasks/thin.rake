namespace :thin do
	desc "Start thin to serve the page"
	task :start do
		system 'nohup ' + File.dirname(__FILE__) + '/../../server.rb > /dev/null &'
	end

	desc "Stop thin"
	task :stop do
		system 'kill `cat ' + File.dirname(__FILE__) + 
'/../../tmp/homepage.pid`'
		system 'rm ' + File.dirname(__FILE__) + '/../../tmp/homepage.pid'
	end
end
