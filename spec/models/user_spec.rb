require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'is valid with valid attributes' do
    user = User.create(id: 123, email: 'steven@mail.com', first_name: 'tom', last_name: 'mboya', password: 'password')
    expect(user).to be_valid
  end

  it 'is valid with valid attributes' do
    user = User.create(id: 345, email: '', first_name: 'tom', last_name: 'mboya', password: 'password')
    expect(user).to_not be_valid
  end

  it 'is valid with valid attributes' do
    user = User.create(id: 567, email: 'tom2@tom.com', first_name: '', last_name: 'mboya', password: 'password')
    expect(user).to_not be_valid
  end
  it 'is valid with valid attributes' do
    user = User.create(id: 789, email: 'tom3@tom.com', first_name: 'tom', last_name: '', password: 'password')
    expect(user).to_not be_valid
  end
  it 'is valid with valid attributes' do
    user = User.create(id: 987, email: 'tom4@tom.com', first_name: 'tom', last_name: 'mboya', password: '')
    expect(user).to_not be_valid
  end
end
