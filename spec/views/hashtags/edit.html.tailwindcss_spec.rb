require 'rails_helper'

RSpec.describe "hashtags/edit", type: :view do
  let(:hashtag) {
    Hashtag.create!(
      name: "MyString",
      hashtags_count: 1
    )
  }

  before(:each) do
    assign(:hashtag, hashtag)
  end

  it "renders the edit hashtag form" do
    render

    assert_select "form[action=?][method=?]", hashtag_path(hashtag), "post" do

      assert_select "input[name=?]", "hashtag[name]"

      assert_select "input[name=?]", "hashtag[hashtags_count]"
    end
  end
end
