require 'rails_helper'

RSpec.describe "songs/new", type: :view do
  before(:each) do
    assign(:song, Song.new(
      title: "MyString",
      content: "MyString",
      catalogue: "MyString",
      status: "MyString",
      poster: nil,
      likes_count: 1
    ))
  end

  it "renders new song form" do
    render

    assert_select "form[action=?][method=?]", songs_path, "post" do

      assert_select "input[name=?]", "song[title]"

      assert_select "input[name=?]", "song[content]"

      assert_select "input[name=?]", "song[catalogue]"

      assert_select "input[name=?]", "song[status]"

      assert_select "input[name=?]", "song[poster_id]"

      assert_select "input[name=?]", "song[likes_count]"
    end
  end
end
