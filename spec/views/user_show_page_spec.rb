require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'Jacob', password: 'password', bio: 'Teacher from Poland',
                            email: 'jacob@gmail.com', posts_counter: 0, confirmed_at: Time.now
      visit "http://localhost:3000/users/sign_in"
      fill_in 'Email', with: 'jacob@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      @post1 = @user1.posts.create!(title: 'JavaScript',
                                    text: 'Learn JavaScript from scratch', comments_counter: 0, likes_counter: 0)
      @post2 = @user1.posts.create!(title: 'Ruby',
                                    text: 'Learn Ruby from scratch', comments_counter: 0, likes_counter: 0)

      visit user_path(@user1.id)
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows the username' do
      expect(page).to have_content('Jacob')
    end

    it 'shows number of posts for each user' do
      expect(page).to have_content('Number of posts: 2')
    end

    it 'shows the users bio' do
      expect(page).to have_content('Teacher from Poland')
    end

    it 'Should see the user\'s first 2 posts.' do
      expect(page).to have_content 'Learn JavaScript from scratch'
      expect(page).to have_content 'Learn Ruby from scratch'
    end

    it 'Can see a button that lets me view all of a users posts' do
      expect(page).to have_content('See all Posts')
    end

    it 'When I click to see all posts, it redirects me to the users posts index page.' do
      click_link 'See all Posts'
      expect(page).to have_current_path user_posts_path(@user1.id)
    end
  end
end
