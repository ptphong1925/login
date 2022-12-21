require 'rails_helper'

RSpec.describe "videos/show", type: :view do
  before(:each) do
    assign(:video, Video.create!(
      title: "Title",
      content: "Content",
      catalogue: "Catalogue",
      status: "Status",
      poster: nil,
      likes_count: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Catalogue/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
