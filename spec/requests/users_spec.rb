require 'rails_helper'

RSpec.describe 'users controller', type: :request do
  describe 'GET user routes' do
    describe 'GET /users' do
      before(:example) { get users_path }

      it 'should return 200 http_status_code' do
        expect(response).to have_http_status(:ok)
      end

      it 'should render the correct template' do
        expect(response).to render_template(:index)
      end

      it 'should display the correct placeholder text' do
        expect(response.body).to include('Mindly blogs')
      end
    end

    describe 'GET /users/:id' do
      before(:example) do
        @user = User.create! name: 'Zweli', password: 'password', email: 'zweli@gmail.com', posts_counter: 0
        get user_path(@user)
      end

      it 'should return 200 http_status_code' do
        expect(response).to have_http_status(:ok)
      end

      it 'should render the correct template' do
        expect(response).to render_template(:show)
      end

      it 'should display the correct placeholder text' do
        expect(response.body).to include('Zweli')
      end
    end
  end
end
