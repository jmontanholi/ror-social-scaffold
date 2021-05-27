require 'rails_helper'
require 'support/feature_helpers'
RSpec.describe 'Users', type: :describe do
  let (:user1) { User.create(name: 'Ariel', email: 'ariel@gmail.com', password: '123123', password_confirmation: '123123') }
  let (:user2) { User.create(name: 'Jenn', email: 'jenn@gmail.com', password: '123123', password_confirmation: '123123') }

  feature 'index page' do

    scenario 'Add a friend' do
      log_in(user2)
      click_link 'Sign out'
      log_in(user1)
      visit '/users'
      click_link 'Add Friend'
      expect(page).to have_content 'Friend request sent'
    end

    scenario 'See profile' do
      log_in(user1)
      visit '/users'
      click_link 'See Profile'
      expect(page).to have_content 'Name: Ariel'
    end

    scenario 'Check for add friend request' do
      log_in(user2)
      visit '/users'
      click_link 'Add Friend'
      click_link 'Sign out'
      log_in(user1)
      visit '/users'
      first('.profile-link').click_link
      expect(page).to have_content 'Jenn Accept Refuse'
    end

    scenario 'Accept friendship' do
      log_in(user2)
      visit '/users'
      click_link 'Add Friend'
      click_link 'Sign out'
      log_in(user1)
      visit '/users'
      first('.profile-link').click_link
      click_link 'Accept'
      expect(page).to have_content 'Friend request accepted'
    end

    scenario 'Refuse friendship' do
      log_in(user2)
      visit '/users'
      click_link 'Add Friend'
      click_link 'Sign out'
      log_in(user1)
      visit '/users'
      first('.profile-link').click_link
      click_link 'Refuse'
      expect(page).to have_content 'Friend request refused'
    end
  end
end