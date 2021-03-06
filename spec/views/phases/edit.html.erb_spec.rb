require 'rails_helper'

RSpec.describe "phases/edit", type: :view do
  before(:each) do
    @phase = assign(:phase, Phase.create!(
      :name => "MyString",
      :id_board => 1,
      :user_email => "MyString"
    ))
  end

  it "renders the edit phase form" do
    render

    assert_select "form[action=?][method=?]", phase_path(@phase), "post" do

      assert_select "input[name=?]", "phase[name]"

      assert_select "input[name=?]", "phase[id_board]"

      assert_select "input[name=?]", "phase[user_email]"
    end
  end
end
