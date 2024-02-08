require 'rails_helper'

RSpec.describe User, type: :feature do
  let(:user) do
    User.create(id: 2, first_name: 'Tom', last_name: 'Mboya', email: 'tom@mail.com', password: '123456')
  end

  describe 'GET /index' do
    it 'displays login content' do
      visit root_path
      expect(page).to have_content('SIGN UP')
    end

    it 'displays login content' do
      visit root_path
      expect(page).to have_content('LOG IN')
    end

    it 'displays links' do
      visit root_path
      expect(page).to have_link('SIGN UP')
    end

    it 'displays links' do
      visit root_path
      expect(page).to have_link('LOG IN')
    end

    it 'displays a logo' do
      visit root_path
      expect(page).to have_content('Budgetly')
    end
  end
end