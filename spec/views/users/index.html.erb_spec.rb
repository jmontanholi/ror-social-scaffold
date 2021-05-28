require 'rails_helper'
require 'support/feature_helpers'
RSpec.describe 'Users', type: :describe do
  let(:user1) do
    User.create(name: 'Ariel', email: 'ariel@gmail.com', password: '123123', password_confirmation: '123123')
  end
  let(:user2) do
    User.create(name: 'Jenn', email: 'jenn@gmail.com', password: '123123', password_confirmation: '123123')
  end

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
  end
end
