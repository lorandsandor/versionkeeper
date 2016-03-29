require 'rails_helper'

RSpec.describe "Releases", type: :request do
  describe "GET /releases" do
    context 'when user not logged in' do
      it 'redirects to login page' do
        get releases_path
        expect(response).to have_http_status(302)
      end
    end

    context 'when user logged in' do
      let(:user) { create :user }
      it 'does not redirect to login page' do
        post user_session_path,
          params: { 'user[email]' => user.email, 'user[password]' => user.password }
        follow_redirect!
        get releases_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
