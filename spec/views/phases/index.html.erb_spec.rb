require 'rails_helper'

RSpec.describe "phases/index", type: :view do
  before(:each) do
    assign(:phases, [
      Phase.create!(
        :name => "Name",
        :id_board => 2
      ),
      Phase.create!(
        :name => "Name",
        :id_board => 2
      )
    ])
  end

  it "renders a list of phases" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
