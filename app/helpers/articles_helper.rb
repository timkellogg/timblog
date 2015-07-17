module ArticlesHelper

	def get_class (tag)

		case tag 
		when 'programming'
			'label'
		when 'misc'
			'secondary'
		when 'sports'
			'sports'
		when 'politics'
			'politics'
		when 'life'
			'life' 
		else 
			'default'	
		end
	end
	
end


