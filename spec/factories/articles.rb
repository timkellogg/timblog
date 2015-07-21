FactoryGirl.define do

  factory :article do  
   	title 'Title'
   	body  'Content'

   	factory :published do 
   		published true 
  	end
  end 
end

	