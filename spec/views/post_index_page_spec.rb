require 'rails_helper'

RSpec.describe 'Post index', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'Zweli', password: 'password', posts_counter: 0, bio: 'Soccer player from Barcelona',
                            email: 'zweli@gmail.com', confirmed_at: Time.now

      visit new_user_session_path
      sleep(1)
      fill_in 'Email', with: 'zweli@gmail.com'
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

      @like1 = @post1.likes.create!(author_id: @user1.id)
      @like2 = @post2.likes.create!(author_id: @user1.id)

      visit user_posts_path(@user1)
    end

    it 'shows user photo' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows the users username' do
      expect(page).to have_content('Zweli')
    end

    it 'shows number of posts by user' do
      expect(page).to have_content('Number of posts: 2')
    end

    it 'shows posts title' do
      expect(page).to have_content('JavaScript')
    end

    it 'can see some of the post\'s content' do
      expect(page).to have_content 'Learn JavaScript from scratch'
    end

    it 'can see on of the comments on a post' do
      expect(page).to have_content 'This is a comment for post 1'
    end

    it 'can see how many comments a post has.' do
      expect(page).to have_content('Comments: 1')
    end

    it 'can see how many likes a post has.' do
      expect(page).to have_content('Likes: 1')
    end

    it 'When I click on a post, it redirects me to that post\'s show page.' do
      click_link 'Ruby'
      expect(page).to have_current_path user_post_path(@post2.author_id, @post2)
    end
  end
end
