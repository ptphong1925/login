require 'rails_helper'

RSpec.describe "friends/show", type: :view do
  before(:each) do
    assign(:friend, Friend.create!(
      accepted?: false,
      friender: nil,
      friendable: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
