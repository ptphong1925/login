require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  let(:book) {
    Book.create!(
      title: "MyString",
      status: "MyString",
      catalogue: "MyString",
      year_published: 1,
      isbn: 1,
      price: "9.99",
      out_of_print: false,
      views_count: 1,
      supplier: nil,
      user: nil
    )
  }

  before(:each) do
    assign(:book, book)
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(book), "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[status]"

      assert_select "input[name=?]", "book[catalogue]"

      assert_select "input[name=?]", "book[year_published]"

      assert_select "input[name=?]", "book[isbn]"

      assert_select "input[name=?]", "book[price]"

      assert_select "input[name=?]", "book[out_of_print]"

      assert_select "input[name=?]", "book[views_count]"

      assert_select "input[name=?]", "book[supplier_id]"

      assert_select "input[name=?]", "book[user_id]"
    end
  end
end
