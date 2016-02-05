require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { validate_presence_of :email }
    it { validate_presence_of :password }

    it { validate_uniqueness_of :email }
  end

  it { is_expected.to have_many(:projects).through(:project_memberships) }
  it { is_expected.to have_many(:project_memberships) }
  it { is_expected.to have_many(:authentications).dependent(:destroy) }
end
