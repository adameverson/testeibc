require 'rails_helper'

RSpec.describe "phases/show", type: :view do
  before(:each) do
    @phase = assign(:phase, Phase.create!(
      :name => "Name",
      :id_board => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
