require 'rails_helper'

RSpec.describe "releases/show", type: :view do
  before(:each) do
    @release = assign(:release, Release.create!(date: Date.today))
  end

  it "renders attributes in <p>" do
    render
  end
end
