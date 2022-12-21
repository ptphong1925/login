require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      title: "MyString",
      content: "MyString",
      catalogue: "MyString",
      status: "MyString",
      poster: nil,
      likes_count: 1
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "input[name=?]", "post[content]"

      assert_select "input[name=?]", "post[catalogue]"

      assert_select "input[name=?]", "post[status]"

      assert_select "input[name=?]", "post[poster_id]"

      assert_select "input[name=?]", "post[likes_count]"
    end
  end
end
