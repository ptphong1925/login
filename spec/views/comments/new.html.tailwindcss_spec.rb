require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      content: "MyString",
      status: "MyString",
      commenter: nil,
      commentable: nil,
      likes_count: 1
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input[name=?]", "comment[content]"

      assert_select "input[name=?]", "comment[status]"

      assert_select "input[name=?]", "comment[commenter_id]"

      assert_select "input[name=?]", "comment[commentable_id]"

      assert_select "input[name=?]", "comment[likes_count]"
    end
  end
end
