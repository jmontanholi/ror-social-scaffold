require 'rails_helper'

RSpec.describe 'Stay in touch', type: :system do
  user = User.create(name: 'Ariel', email: 'ariel@gmail.com', password: '123123', password_confirmation: '123123')

  describe 'index page' do
    it 'show the right content (Brand name)' do
      login_as(user)
      visit posts_path
      sleep(5)
      expect(page).to have_content('STAY IN TOUCH')
    end
  end
end