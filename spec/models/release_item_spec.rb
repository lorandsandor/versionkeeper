require 'rails_helper'

RSpec.describe ReleaseItem, type: :model do
  it { is_expected.to belong_to :release }
end
