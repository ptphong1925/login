require 'rails_helper'

RSpec.describe "hashtags/new", type: :view do
  before(:each) do
    assign(:hashtag, Hashtag.new(
      name: "MyString",
      hashtags_count: 1
    ))
  end

  it "renders new hashtag form" do
    render

    assert_select "form[action=?][method=?]", hashtags_path, "post" do

      assert_select "input[name=?]", "hashtag[name]"

      assert_select "input[name=?]", "hashtag[hashtags_count]"
    end
  end
end
