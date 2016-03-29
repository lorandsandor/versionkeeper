require 'rails_helper'

RSpec.describe "Releases", type: :feature do
  describe "GET /releases" do
    context 'when user not logged in' do
      it 'redirects to login path' do
        visit releases_path

        expect(page).to have_content 'Sign in with GitHub'
        expect(page).to_not have_content 'Releases'
      end
    end

    context 'when user logged in' do
      it 'it does not redirect' do
        visit new_user_registration_path
        email = 'abcd@example.com'
        fill_in 'user_email', :with => email
        fill_in 'user_password', :with => 'password'
        fill_in 'user_password_confirmation', :with => 'password'
        click_button 'Sign up'
        expect(page).to have_content 'Welcome! You have signed up successfully.'

        visit releases_path

        expect(page.status_code).to eq 200
        expect(page).to have_content 'Releases'
      end
    end
  end
end
