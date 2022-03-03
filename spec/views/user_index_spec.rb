require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'Zweli', password: 'password', email: 'zweli@gmail.com', posts_counter: 0, confirmed_at: Time.now
      @user2 = User.create! name: 'Lucky', password: 'password', email: 'lucky@gmail.com', posts_counter: 0, confirmed_at: Time.now
      visit "http://localhost:3000/users/sign_in"
      fill_in 'Email', with: 'zweli@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit users_path
    end

    it 'shows the username of other users' do
      expect(page).to have_content('Zweli')
      expect(page).to have_content('Lucky')
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(2)
    end

    it 'shows number of posts for each user' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'show users page when clicked' do
      expect(page).to have_content('Number of posts: 0')
      click_on 'Zweli'
      expect(page).to have_current_path user_path(@user1)
      expect(page).to have_no_content('Lucky')
    end
  end
end
