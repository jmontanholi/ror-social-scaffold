require 'rails_helper'

require 'rails_helper'
RSpec.describe User, type: :model do 
  it 'succeeds when you create a user with valid inputs' do
    expect(User.create(name:"thisisvalid", 
                email:"valid@email", 
                password:"123456", 
                password_confirmation:"123456")).to eq(User.find_by(name:"thisisvalid"))
  end
end