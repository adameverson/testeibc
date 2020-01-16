require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :task => "MyText",
      :id_phase => 1,
      :user_email => "MyString"
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "textarea[name=?]", "task[task]"

      assert_select "input[name=?]", "task[id_phase]"

      assert_select "input[name=?]", "task[user_email]"
    end
  end
end
