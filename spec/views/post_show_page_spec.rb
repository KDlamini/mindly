require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'Bheki', password: 'password', posts_counter: 0, bio: 'Scientist from Carlifonia',
                            email: 'bheki@gmail.com', confirmed_at: Time.now
      @user2 = User.create! name: 'Zola', password: 'password', posts_counter: 0, bio: 'Dancer from New York',
                            email: 'zola@gmail.com', confirmed_at: Time.now

      visit new_user_session_path
      sleep(1)
      fill_in 'Email', with: 'bheki@gmail.com'
      fill_in 'Password', with: 'password'
      sleep(1)
      click_button 'Log in'
      sleep(1)

      @post1 = @user1.posts.create!(title: 'JavaScript',
                                    text: 'Learn JavaScript from scratch', comments_counter: 0, likes_counter: 0)
      @post2 = @user1.posts.create!(title: 'Ruby',
                                    text: 'Learn Ruby from scratch', comments_counter: 0, likes_counter: 0)

      @comment1 = @post1.comments.create!(text: 'This is a comment for post 1', author_id: @user1.id)
      @comment2 = @post2.comments.create!(text: 'This is a comment for post 2', author_id: @user1.id)

      @like1 = @post1.likes.create!(author_id: @user2.id)
      @like2 = @post2.likes.create!(author_id: @user2.id)

      visit user_post_path(@user1, @post1)
    end

    it 'shows posts title' do
      expect(page).to have_content('JavaScript')
    end

    it 'shows the person who wrote the post' do
      expect(page).to have_content('Bheki')
    end

    it 'shows number of comments' do
      expect(page).to have_content('Comments: 1')
    end

    it 'shows number of likes' do
      expect(page).to have_content('Likes: 1')
    end

    it 'can see the post\'s content.' do
      expect(page).to have_content('Learn JavaScript from scratch')
    end

    it 'can see the username of each commentor.' do
      expect(page).to have_content 'Bheki'
    end

    it 'can see the comments of each commentor.' do
      expect(page).to have_content 'This is a comment for post 1'
    end
  end
end
