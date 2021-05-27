require 'rails_helper'

RSpec.describe 'Stay in touch', type: :system do
  let(:user1) do
    User.create(name: 'Ariel', email: 'ariel@gmail.com', password: '123123', password_confirmation: '123123')
  end
  let(:user2) do
    User.create(name: 'Jenn', email: 'jenn@gmail.com', password: '123123', password_confirmation: '123123')
  end

  feature 'Friendship' do
    scenario 'Check for add friend request' do
      jenn_and_ariel
      first('.profile-link').click_link
      expect(page).to have_content 'Jenn Accept Refuse'
    end

    scenario 'Accept friendship' do
      jenn_and_ariel
      first('.profile-link').click_link
      click_link 'Accept'
      expect(page).to have_content 'Friend request accepted'
    end

    scenario 'Refuse friendship' do
      jenn_and_ariel
      first('.profile-link').click_link
      click_link 'Refuse'
      expect(page).to have_content 'Friend request refused'
    end
  end
end
