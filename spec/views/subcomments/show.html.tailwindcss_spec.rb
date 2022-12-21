require 'rails_helper'

RSpec.describe "subcomments/show", type: :view do
  before(:each) do
    assign(:subcomment, Subcomment.create!(
      content: "Content",
      status: "Status",
      subcommenter: nil,
      comment: nil,
      likes_count: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
