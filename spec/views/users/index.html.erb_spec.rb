require 'rails_helper'

RSpec.describe 'Stay in touch', type: :feature do
  let (:user) { User.create(name: 'Ariel', email: 'ariel@gmail.com', password: '123123', password_confirmation: '123123') }
  let (:post) { user.posts.create(content: "Writing a capybara test") }

  describe 'index page' do
    background do
      logged_as user
    end  
    it 'show the right content (Brand name)' do
      visit posts_path
      sleep(5)
      expect(page).to have_content('STAY IN TOUCH')
    end

    it 'create the post in page' do
      #page.set_rack_session(user_id: user.id)
      visit posts_path
      sleep(5)
      fill_in "Content", with: "Writing a capybara test"
      click_button "Save"
      expect(page).to have_content("Success")
    end

    it 'show the list of posts' do
      #page.set_rack_session(user_id: user.id)
      visit posts_path
      sleep(5)
      expect(page).to have_content("Writing a capybara test")
    end   
  end
end