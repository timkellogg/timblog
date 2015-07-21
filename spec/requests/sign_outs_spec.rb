require 'rails_helper'

RSpec.describe "SignOuts", type: :request do
  describe "the sign out path" do
    it "signs out a user and redirects to root page" do
    	user = FactoryGirl.create(:user, :email => 'user@gmail.com', :password => 'password')

    	visit '/users/sign_in' 
      fill_in 'user_email', 	 :with => 'user@gmail.com'
      fill_in 'user_password', :with => 'password'
      click_button 'Log in'
      expect(current_path).to eq '/' 

      click_link 'Logout'

    end
  end
end



