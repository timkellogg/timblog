# Create Articles 
10.times do |article|
	title 		= Faker::Lorem.sentence
	body 		 	= Faker::Lorem.sentence(rand(12..50))
	image_url = Faker::Avatar.image

	Article.create!(
		title: 			title,
		body:  			body,
		image_url: 	image_url 
	)
end

User.create!(
	email: 'tim.kellogg@gmail.com',
	password: 'l@kers24',
	admin: true 
)


