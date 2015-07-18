FactoryGirl.define do 
	factory :user do
		email: 'admin@gmail.com',
		password: 'password',
		admin: true 
	end

	factory :articles do 
		
	end
end
