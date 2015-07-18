require 'rails_helper'

RSpec.describe Article, type: :model do
  
	context 'with no title' do 
		it 'should be invalid' do 
			new_article = Article.new(title: '') 	
			expect(new_article).to_not be_valid  
		end
	end

	context 'with no body' do 
		it 'should be invalid' do 
			new_article = Article.new(title: 'Title', body: '')
			expect(new_article).to_not be_valid 
		end
	end
end

