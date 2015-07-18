require 'rails_helper'

describe Article do 

	describe 'with no content' do 
		before { @article.body = '' }
		it { should_not_be_valid }
	end
end