require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /projects" do
    context 'when user not logged in' do
      it 'redirects to login page' do
        get projects_path
        expect(response).to have_http_status(302)
      end
    end

    context 'when user logged in' do
      let(:user) { create :user }
      it 'does not redirect to login page' do
        post user_session_path,
          params: { 'user[email]' => user.email,
                    'user[password]' => user.password }
        follow_redirect!
        get projects_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
