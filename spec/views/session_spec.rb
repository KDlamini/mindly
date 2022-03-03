require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do
    before(:each) do
      User.create! name: 'Vuma', email: 'vuma@gmail.com', password: 'password', posts_counter: 0, confirmed_at: Time.now
    end

    it 'Fill email and password inputs' do
      visit new_user_session_path
      sleep(1)
      fill_in 'Email', with: 'gus@gmail.com'
      fill_in 'Password', with: 'password'
      sleep(1)
      click_button 'Log in'
      sleep(3)
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Without fill email and password inputs' do
      visit new_user_session_path
      sleep(1)
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      sleep(1)
      click_button 'Log in'
      sleep(3)
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Fill email and password inputs' do
      visit new_user_session_path
      sleep(1)
      fill_in 'Email', with: 'vuma@gmail.com'
      fill_in 'Password', with: 'password'
      sleep(1)
      click_button 'Log in'
      sleep(3)
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_current_path root_path
    end
  end
end
