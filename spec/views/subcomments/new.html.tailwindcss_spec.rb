require 'rails_helper'

RSpec.describe "subcomments/new", type: :view do
  before(:each) do
    assign(:subcomment, Subcomment.new(
      content: "MyString",
      status: "MyString",
      commenter: nil,
      comment: nil,
      likes_count: 1
    ))
  end

  it "renders new subcomment form" do
    render

    assert_select "form[action=?][method=?]", subcomments_path, "post" do

      assert_select "input[name=?]", "subcomment[content]"

      assert_select "input[name=?]", "subcomment[status]"

      assert_select "input[name=?]", "subcomment[commenter_id]"

      assert_select "input[name=?]", "subcomment[comment_id]"

      assert_select "input[name=?]", "subcomment[likes_count]"
    end
  end
end
