require 'rails_helper'

RSpec.describe "videos/new", type: :view do
  before(:each) do
    assign(:video, Video.new(
      title: "MyString",
      content: "MyString",
      catalogue: "MyString",
      status: "MyString",
      poster: nil,
      likes_count: 1
    ))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do

      assert_select "input[name=?]", "video[title]"

      assert_select "input[name=?]", "video[content]"

      assert_select "input[name=?]", "video[catalogue]"

      assert_select "input[name=?]", "video[status]"

      assert_select "input[name=?]", "video[poster_id]"

      assert_select "input[name=?]", "video[likes_count]"
    end
  end
end
