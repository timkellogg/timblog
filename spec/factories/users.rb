FactoryGirl.define do 

	factory :user do 
		email 'user@gmail.com'
		password 'password'

		factory :admin do 
			admin true 
		end
	end
end