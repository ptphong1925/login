require 'rails_helper'

RSpec.describe "videos/edit", type: :view do
  let(:video) {
    Video.create!(
      title: "MyString",
      content: "MyString",
      catalogue: "MyString",
      status: "MyString",
      poster: nil,
      likes_count: 1
    )
  }

  before(:each) do
    assign(:video, video)
  end

  it "renders the edit video form" do
    render

    assert_select "form[action=?][method=?]", video_path(video), "post" do

      assert_select "input[name=?]", "video[title]"

      assert_select "input[name=?]", "video[content]"

      assert_select "input[name=?]", "video[catalogue]"

      assert_select "input[name=?]", "video[status]"

      assert_select "input[name=?]", "video[poster_id]"

      assert_select "input[name=?]", "video[likes_count]"
    end
  end
end
