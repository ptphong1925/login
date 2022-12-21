require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    assign(:book, Book.create!(
      title: "Title",
      status: "Status",
      catalogue: "Catalogue",
      year_published: 2,
      isbn: 3,
      price: "9.99",
      out_of_print: false,
      views_count: 4,
      supplier: nil,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Catalogue/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
