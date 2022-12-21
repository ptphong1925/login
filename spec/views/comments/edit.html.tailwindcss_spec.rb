require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  let(:comment) {
    Comment.create!(
      content: "MyString",
      status: "MyString",
      commenter: nil,
      commentable: nil,
      likes_count: 1
    )
  }

  before(:each) do
    assign(:comment, comment)
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(comment), "post" do

      assert_select "input[name=?]", "comment[content]"

      assert_select "input[name=?]", "comment[status]"

      assert_select "input[name=?]", "comment[commenter_id]"

      assert_select "input[name=?]", "comment[commentable_id]"

      assert_select "input[name=?]", "comment[likes_count]"
    end
  end
end
