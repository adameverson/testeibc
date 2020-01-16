require 'rails_helper'

RSpec.describe "boards/index", type: :view do
  before(:each) do
    assign(:boards, [
      Board.create!(
        :name => "Name",
        :user_email => "User Email"
      ),
      Board.create!(
        :name => "Name",
        :user_email => "User Email"
      )
    ])
  end

  it "renders a list of boards" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "User Email".to_s, :count => 2
  end
end
