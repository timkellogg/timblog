require 'rails_helper'

RSpec.describe User, type: :model do

	before do
	  @user = User.new(email: 'user@example.com', password: 'password')
	end

	context 'when created' do
		it 'user should not be an admin' do 
			expect(@user.admin).not_to eq(true) 
		end
	end

	context 'with invalid email format' do 
		it 'should not be valid' do 
	    addresses = %w[usrer@foo,com user_at_foo.org example.user@foo.
	                   foo@bar_baz.com foo@bar+baz.com foo@bar..com]
	    addresses.each do |invalid_address|
	      @user.email = invalid_address
	      expect(@user).not_to be_valid
	    end
		end
	end

	context 'with valid email format' do 
		it 'should be valid' do 
	    addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	    addresses.each do |valid_address|
	      @user.email = valid_address
	    	expect(@user).to be_valid			
			end
		end
	end
end 