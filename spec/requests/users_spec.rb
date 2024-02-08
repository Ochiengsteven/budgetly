require 'rails_helper'

RSpec.describe User, type: :request do
  let(:user) do
    User.create(id: 2, first_name: 'Tom', last_name: 'Mboya', email: 'tom@mail.com', password: '123456')
  end

  describe 'GET /index' do
    before do
      get users_path
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('class="text-gray-600 login no-underline bg-[#3978c3] w-[80vw] p-4 text-center rounded" href="/users/sign_in">LOG IN</a>')
    end
  end
end