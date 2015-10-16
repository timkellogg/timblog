require 'rails_helper'

describe "the authentication process" do 

  describe "the sign in path" do
  	let(:user) 			   { FactoryGirl.create(:user)      }
  	let(:admin)    	   { FactoryGirl.create(:admin)     }
    let!(:article)     { FactoryGirl.create(:article)   }
    let!(:published)   { FactoryGirl.create(:published) }

    it "lets a valid user login and redirects to main page" do
    	visit '/users/sign_in' 
      fill_in 'user_email', 	 :with => admin.email
      fill_in 'user_password', :with => admin.password 
      click_button 'Log in'
      expect(current_path).to eq '/'
      expect(page).to have_css('#articles-list')
    end

    it 'does not let an invalid user login' do 
    	visit '/users/sign_in'
    	fill_in 'user_email',		 :with => 'invalid@gmail.com'
    	fill_in 'user_password', :with => 'invalid'
    	click_button 'Log in'
    	expect(current_path).to eq '/users/sign_in'
    end

    it 'lets a non-admin user login and redirects to main page but prevents edit links' do
    	visit '/users/sign_in'
    	fill_in 'user_email',		  :with => user.email 
    	fill_in 'user_password',  :with => user.password 
    	click_button 'Log in'
    	expect(current_path).to eq '/'
    	expect(page).to_not have_css('span.admin-edit')
      expect(page).to_not have_css('dl.unpublished')
    end
  end
end
