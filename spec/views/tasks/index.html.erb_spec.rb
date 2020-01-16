require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :task => "MyText",
        :id_phase => 2,
        :user_email => "User Email"
      ),
      Task.create!(
        :task => "MyText",
        :id_phase => 2,
        :user_email => "User Email"
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "User Email".to_s, :count => 2
  end
end
