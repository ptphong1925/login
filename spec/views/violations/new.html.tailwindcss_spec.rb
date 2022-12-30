require 'rails_helper'

RSpec.describe "violations/new", type: :view do
  before(:each) do
    assign(:violation, Violation.new(
      name: "MyString"
    ))
  end

  it "renders new violation form" do
    render

    assert_select "form[action=?][method=?]", violations_path, "post" do

      assert_select "input[name=?]", "violation[name]"
    end
  end
end