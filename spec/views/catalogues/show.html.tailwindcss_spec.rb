require 'rails_helper'

RSpec.describe "catalogues/show", type: :view do
  before(:each) do
    assign(:catalogue, Catalogue.create!(
      name: "Name",
      parent_id: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
