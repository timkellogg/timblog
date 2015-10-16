require 'rails_helper'


describe 'articles' do 

  describe "process" do 
    let(:admin)  { FactoryGirl.create(:admin) }

    it "should allow admin to create, edit and delete articles" do  
      visit '/users/sign_in' 
      fill_in 'user_email',    :with => admin.email
      fill_in 'user_password', :with => admin.password 
      click_button 'Log in'
      visit root_url 
      click_link 'New Article'
      fill_in 'Tag list', :with => 'Sports'
      fill_in 'Title',    :with => 'Why the Ducks will be good next year'
      fill_in 'editor',   :with => 'They have great recruiting, excellent coaches and a loyal fanbase.'
      click_button 'Save Article'
      expect(page).to have_content('Ducks')

      click_link 'Edit'
      fill_in 'Title', :with => 'Why the Lakers will not be good next year'
      fill_in 'editor',   :with => 'They are too old, expensive and draft the wrong players.'
      click_button 'Save Article'
      expect(page).to have_content('Lakers')

      click_link 'Destroy'
      expect(page).to have_content('thoughts')
    end
  end

end 

