require 'rails_helper'

RSpec.describe User, type: :model do 
  it 'Succeeds when you create a user with valid inputs' do
    expect(User.create(name:"thisisvalid", 
                email:"valid@email", 
                password:"123456", 
                password_confirmation:"123456")).to eq(User.find_by(name:"thisisvalid"))
  end

  it 'It fails if not all the parameters passed are valid' do
    user = User.create(name:'', email:'', password:'', password_confirmation:'')
    expect(user.errors.full_messages).to eq(["Email can't be blank", "Password can't be blank", "Name can't be blank"])
  end
end