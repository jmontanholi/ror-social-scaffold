require 'rails_helper'

RSpec.describe 'Stay in touch', type: :system do
  user = User.create(name: 'Ariel', email: 'ariel@gmail.com', password: '123123', password_confirmation: '123123')
end