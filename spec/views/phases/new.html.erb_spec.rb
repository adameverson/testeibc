require 'rails_helper'

RSpec.describe "phases/new", type: :view do
  before(:each) do
    assign(:phase, Phase.new(
      :name => "MyString",
      :id_board => 1
    ))
  end

  it "renders new phase form" do
    render

    assert_select "form[action=?][method=?]", phases_path, "post" do

      assert_select "input[name=?]", "phase[name]"

      assert_select "input[name=?]", "phase[id_board]"
    end
  end
end
