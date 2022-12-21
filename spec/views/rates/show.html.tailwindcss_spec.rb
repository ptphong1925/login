require 'rails_helper'

RSpec.describe "rates/show", type: :view do
  before(:each) do
    assign(:rate, Rate.create!(
      rate: "Rate",
      rater: nil,
      rateable: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Rate/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
