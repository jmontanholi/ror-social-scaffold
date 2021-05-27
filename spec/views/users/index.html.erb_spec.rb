require 'rails_helper'
require 'support/feature_helpers'
RSpec.describe 'Stay in touch', type: :describe do
  let (:user) { User.create(name: 'Ariel', email: 'ariel@gmail.com', password: '123123', password_confirmation: '123123') }

  feature 'index page' do
    
    scenario 'Signing in with correct credentials' do
      log_in(user)
      expect(page).to have_content 'successfully'
    end

    scenario 'Create the post in page' do
      log_in(user)
      visit '/posts'
      create_post
      expect(page).to have_content 'successfully'
    end

    scenario 'Shows the list of posts' do
      log_in(user)
      create_post
      create_post
      # visit posts_path
      sleep(5)
      expect(page).to have_content('Please work capybara')
    end

    scenario 'When you click like it likes the post' do
      log_in(user)
      create_post
      click_link 'Like!'
      expect(page).to have_content 'You liked a post.'
    end
  end
end