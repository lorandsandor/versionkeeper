require 'rails_helper'

RSpec.describe Project, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to have_many :applications }
  it { is_expected.to have_many :releases }
end
