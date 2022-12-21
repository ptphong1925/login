require 'rails_helper'

RSpec.describe "songs/edit", type: :view do
  let(:song) {
    Song.create!(
      title: "MyString",
      content: "MyString",
      catalogue: "MyString",
      status: "MyString",
      poster: nil,
      likes_count: 1
    )
  }

  before(:each) do
    assign(:song, song)
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(song), "post" do

      assert_select "input[name=?]", "song[title]"

      assert_select "input[name=?]", "song[content]"

      assert_select "input[name=?]", "song[catalogue]"

      assert_select "input[name=?]", "song[status]"

      assert_select "input[name=?]", "song[poster_id]"

      assert_select "input[name=?]", "song[likes_count]"
    end
  end
end
