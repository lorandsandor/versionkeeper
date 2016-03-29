require 'rails_helper'

RSpec.describe Repository, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to_not validate_presence_of :source_control_uri }

  it { is_expected.to belong_to :project }
end
