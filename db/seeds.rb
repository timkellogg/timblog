# Create articles 
20.times do |n|
	new_article = Article.create!(
		title: 			Faker::Lorem.sentence,
		body:  			Faker::Lorem.sentence(1000),
		image_url: 	Faker::Avatar.image,
		published:  [true, false].sample 
	)
end


TAGS = %w[programming education politics sports science exercising music ruby javascript rails funny ember life] 

# Create tags and add them to articles 
TAGS.length.times do |n|
	# Create tags uniquely grabbing from TAGS constant 
	new_tag = Tag.create!(
		name: TAGS.pop
	)
	# Set tag at least to one Article but up to as many as all of them; prevent same tag to same article 
	rand(1..3).times do |i|
		new_tag.taggings.create!(
			article_id: rand(1..20) 
		)
	end 
end

# Create admin user 
User.create!(
	email: 'tim.kellogg@gmail.com',
	password: 'password',
	admin: true 
)
