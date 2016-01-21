require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { validate_presence_of :email }
    it { validate_uniqueness_of :email }

    it { validate_presence_of :password }
  end
end
