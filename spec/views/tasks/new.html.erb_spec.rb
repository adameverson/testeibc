require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :task => "MyText",
      :id_phase => 1,
      :user_email => "MyString"
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "textarea[name=?]", "task[task]"

      assert_select "input[name=?]", "task[id_phase]"

      assert_select "input[name=?]", "task[user_email]"
    end
  end
end
