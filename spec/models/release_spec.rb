require 'rails_helper'

RSpec.describe Release, type: :model do
  it { is_expected.to belong_to :project }
  it { is_expected.to have_many(:release_items).dependent(:destroy) }

  it { validate_presence_of :date }
end
