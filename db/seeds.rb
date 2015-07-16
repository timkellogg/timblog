# # Create Articles 
# 50.times do |article|
# 	title 		= Faker::Lorem.sentence
# 	body 		 	= Faker::Lorem.sentence(1000)
# 	image_url = Faker::Avatar.image
# 	tags      = %w[programming sports school politics life music]

# 	Article.create!(
# 		title: 			title,
# 		body:  			body,
# 		image_url: 	image_url,
# 		tags:       tags.sample(1)
# 	)
# end

User.create!(
	email: 'tim.kellogg@gmail.com',
	password: 'l@kers24',
	admin: true 
)


