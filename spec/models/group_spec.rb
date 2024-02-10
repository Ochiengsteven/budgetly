require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) do
    User.create(id: 101, first_name: 'tom', last_name: 'mboya', email: 'tom@tom.com', password: 'password')
  end

  before do
    @group_params = {
      id: 23,
      name: 'Bills',
      icon: 'https://img.icons8.com/external-flaticons-lineal-color-flat-icons/64/external-taxes-banking-flaticons-lineal-color-flat-icons-4.png',
      user_id: user.id
    }
  end

  it 'is not valid with empty name' do
    @group_params[:name] = ''
    group = Group.create(@group_params)
    expect(group.errors[:name]).to include("can't be blank")
  end

  it 'is not valid with empty icon' do
    @group_params[:icon] = ''
    group = Group.create(@group_params)
    expect(group.errors[:icon]).to include("can't be blank")
  end

  it 'icon has to start with https' do
    @group_params[:icon] = 'www.example.png'
    group = Group.create(@group_params)
    expect(group.errors[:icon]).to include('It must have a valid format (https:// .png or .jpg)')
  end

  it 'icon has to start with https' do
    @group_params[:icon] = 'https://example.com'
    group = Group.create(@group_params)
    expect(group.errors[:icon]).to include('It must have a valid format (https:// .png or .jpg)')
  end
end
