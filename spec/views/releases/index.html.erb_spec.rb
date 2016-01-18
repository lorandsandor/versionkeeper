require 'rails_helper'

RSpec.describe "releases/index", type: :view do
  before(:each) do
    assign(:releases, [
      Release.create!(date: Date.today),
      Release.create!(date: Date.yesterday)
    ])
  end

  it "renders a list of releases" do
    render
  end
end
