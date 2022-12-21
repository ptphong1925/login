require 'rails_helper'

RSpec.describe "nations/show", type: :view do
  before(:each) do
    assign(:nation, Nation.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
