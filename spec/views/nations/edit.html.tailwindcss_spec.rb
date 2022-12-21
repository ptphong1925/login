require 'rails_helper'

RSpec.describe "nations/edit", type: :view do
  let(:nation) {
    Nation.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:nation, nation)
  end

  it "renders the edit nation form" do
    render

    assert_select "form[action=?][method=?]", nation_path(nation), "post" do

      assert_select "input[name=?]", "nation[name]"
    end
  end
end
