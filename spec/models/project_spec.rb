require 'rails_helper'

RSpec.describe Project, type: :model do
  it { is_expected.to validate_presence_of :name }

  it { is_expected.to have_many(:repositories).dependent(:destroy) }
  it { is_expected.to have_many(:releases).dependent(:destroy) }

  it { is_expected.to have_many(:users).through(:project_memberships) }

  it 'does not create Application if Application name is blank' do
    expect {
      Project.create!(name: 'foo', repositories_attributes: [{ name: nil }])}
        .not_to change{ Repository.count }
  end
end
