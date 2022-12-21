require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let(:post) {
    Post.create!(
      title: "MyString",
      content: "MyString",
      catalogue: "MyString",
      status: "MyString",
      poster: nil,
      likes_count: 1
    )
  }

  before(:each) do
    assign(:post, post)
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(post), "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "input[name=?]", "post[content]"

      assert_select "input[name=?]", "post[catalogue]"

      assert_select "input[name=?]", "post[status]"

      assert_select "input[name=?]", "post[poster_id]"

      assert_select "input[name=?]", "post[likes_count]"
    end
  end
end
