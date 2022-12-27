require 'rails_helper'

RSpec.describe "hashtags/show", type: :view do
  before(:each) do
    assign(:hashtag, Hashtag.create!(
      name: "Name",
      hashtags_count: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
