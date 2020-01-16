require 'rails_helper'

RSpec.describe "phases/show", type: :view do
  before(:each) do
    @phase = assign(:phase, Phase.create!(
      :name => "Name",
      :id_board => 2,
      :user_email => "User Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/User Email/)
  end
end
