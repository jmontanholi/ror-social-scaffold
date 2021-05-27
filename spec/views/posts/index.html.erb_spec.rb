require 'rails_helper'
require 'support/feature_helpers'
RSpec.describe 'Posts', type: :describe do
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
      sleep(5)
      expect(page).to have_content('Please work capybara')
    end

    scenario 'When you click like it likes the post' do
      log_in(user)
      create_post
      click_link 'Like!'
      expect(page).to have_content 'You liked a post.'
    end

    scenario 'When you click dislike it dislikes the post' do
      log_in(user)
      create_post
      click_link 'Like!'
      click_link 'Dislike!'
      expect(page).to have_content 'You disliked a post.'
    end

    scenario 'When you write a comment and click comment you create it' do
      log_in(user)
      create_post
      create_comment
      expect(page).to have_content 'This is a comment'
    end 

    scenario 'When you click ALL USERS you go to users#index' do
      log_in(user)
      click_link 'All users'
      expect(page).to have_content 'Name'
    end

    scenario 'When you click sign out your session is ended' do
      log_in(user)
      click_link 'Sign out'
      expect(page).to have_content 'Sign in'
    end
  end
end