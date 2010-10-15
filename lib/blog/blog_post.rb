class BlogPost
	attr_reader :title, :text, :created_at, :index
	
	def initialize(text, created_at, index)
		@title = text.lines.to_a[0]
		@text = text.lines.to_a[1..-1].join
		@created_at = Date.strptime(created_at, "%Y%m%d")
		@index = index
	end
end