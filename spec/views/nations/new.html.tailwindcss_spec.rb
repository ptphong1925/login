require 'rails_helper'

RSpec.describe "nations/new", type: :view do
  before(:each) do
    assign(:nation, Nation.new(
      name: "MyString"
    ))
  end

  it "renders new nation form" do
    render

    assert_select "form[action=?][method=?]", nations_path, "post" do

      assert_select "input[name=?]", "nation[name]"
    end
  end
end
