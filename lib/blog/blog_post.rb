class BlogPost
	attr_reader :title, :text, :created_at, :index, :teaser
	
	def initialize(text, created_at, index)
		@title = text.lines.to_a[0]
		@created_at = Date.strptime(created_at, "%Y%m%d")
		@index = index
		@teaser = create_teaser(text.lines.to_a[1..-1].join)
		@text = create_text(text.lines.to_a[1..-1].join)
	end
	
	private
	def create_text(text)
		if @teaser != text
			text_1 = text[0...(text =~ /^\^+$/)]
			text_2 = text[((text =~ /^\^+$/) + 1)..(text.length - 1)]
			text_2 = text_2.lines.to_a[1..-1].join
			return text_1 + text_2
		end
		
		return text
	end
	
	def create_teaser(text, end_string = "\n[...]")
		if text =~ /^\^+$/
			teaser = text[0...(text =~ /^\^+$/)] + end_string
		else
			teaser = text
		end
	end
end
