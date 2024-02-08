require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) do
    User.create(id: 2, first_name: 'tom', last_name: 'mboya', email: 'tom@tom.com', password: 'password')
  end

  let(:group) do
    Group.create(id: 9802, name: 'Entertainment', icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png',
                 user_id: 892)
  end

  let(:entity) do
    Entity.create(id: 852, name: 'Entertainment', amount: 2.5, author_id: user.id, group_id: group.id)
  end

  before do
    @valid_group_params = { id: 729, name: 'Movies', icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png',
                            user_id: user.id }
  end

  it 'is not valid with empty name' do
    @valid_group_params[:name] = ''
    group = Group.create(@valid_group_params)
    expect(group).not_to be_valid
    expect(group.errors[:name]).to include("can't be blank")
  end

  it 'is not valid if amount is negative number' do
    entity = Entity.create(id: 2003, name: 'Theater', amount: -2, author_id: user.id, group_id: group.id)
    expect(entity).not_to be_valid
    expect(entity.errors[:amount]).to include('must be greater than or equal to 0')
  end

  it 'is not valid if amount is a string' do
    entity = Entity.create(id: 7421, name: 'Theater', amount: 'two', author_id: user.id, group_id: group.id)
    expect(entity).not_to be_valid
    expect(entity.errors[:amount]).to include('is not a number')
  end
end
