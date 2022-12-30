require 'rails_helper'

RSpec.describe "violations/show", type: :view do
  before(:each) do
    assign(:violation, Violation.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
