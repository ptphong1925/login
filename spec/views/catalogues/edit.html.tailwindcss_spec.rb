require 'rails_helper'

RSpec.describe "catalogues/edit", type: :view do
  let(:catalogue) {
    Catalogue.create!(
      name: "MyString",
      parent_id: 1
    )
  }

  before(:each) do
    assign(:catalogue, catalogue)
  end

  it "renders the edit catalogue form" do
    render

    assert_select "form[action=?][method=?]", catalogue_path(catalogue), "post" do

      assert_select "input[name=?]", "catalogue[name]"

      assert_select "input[name=?]", "catalogue[parent_id]"
    end
  end
end
