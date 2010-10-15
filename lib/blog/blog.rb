class Blog
	
	def get_all_posts
		posts = []
		Dir[Settings.app_root + Settings.dir_blogposts + '/*.md'].sort.reverse.each do |filename|
			post_file = File.basename(filename).match(/(.+)\.md/)[1]
			post_data = post_file.match(/(\d{8})-(\d{2})-(.+)/)	
			
			text = ''
			File.open(filename, 'r') { |f| text = f.read }
			post = BlogPost.new(text, post_data[1], post_data[3])
			
			posts << post
		end
		
		return posts
	end
	
	def find(title)
		posts = self.get_all_posts
		posts.each do |post|
			return post if post.index == title
		end
		
		return 404
	end
end