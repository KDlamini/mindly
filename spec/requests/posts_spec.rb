require 'rails_helper'

RSpec.describe 'posts controller', type: :request do
  describe 'GET posts routes' do
    describe 'GET /users/:user_id/posts' do
      before(:example) do
        @user = User.create! name: 'Zweli', password: 'password', email: 'zweli@gmail.com', posts_counter: 0
        get user_posts_path(@user)
      end

      it 'should return 200 http_status_code' do
        expect(response).to have_http_status(:ok)
      end

      it 'should render the correct template' do
        expect(response).to render_template(:index)
      end

      it 'should display the correct placeholder text' do
        expect(response.body).to include('Zweli')
      end
    end

    describe 'GET /users/:user_id/posts/:id' do
      before(:example) do
        @user = User.create! name: 'Zweli', password: 'password', email: 'zweli@gmail.com', posts_counter: 0
        @post = @user.posts.create!(title: 'JavaScript',
                                    text: 'Learn JavaScript from scratch', comments_counter: 0, likes_counter: 0)
        get user_post_path(@user, @post)
      end

      it 'should return 200 http_status_code' do
        expect(response).to have_http_status(:ok)
      end

      it 'should render the correct template' do
        expect(response).to render_template(:show)
      end

      it 'should display the correct placeholder text' do
        expect(response.body).to include('JavaScript')
      end
    end
  end
end
