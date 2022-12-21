require 'rails_helper'

RSpec.describe "catalogues/new", type: :view do
  before(:each) do
    assign(:catalogue, Catalogue.new(
      name: "MyString",
      parent_id: 1
    ))
  end

  it "renders new catalogue form" do
    render

    assert_select "form[action=?][method=?]", catalogues_path, "post" do

      assert_select "input[name=?]", "catalogue[name]"

      assert_select "input[name=?]", "catalogue[parent_id]"
    end
  end
end
