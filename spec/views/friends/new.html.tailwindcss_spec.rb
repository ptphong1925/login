require 'rails_helper'

RSpec.describe "friends/new", type: :view do
  before(:each) do
    assign(:friend, Friend.new(
      accepted?: false,
      friender: nil,
      friendable: nil
    ))
  end

  it "renders new friend form" do
    render

    assert_select "form[action=?][method=?]", friends_path, "post" do

      assert_select "input[name=?]", "friend[accepted?]"

      assert_select "input[name=?]", "friend[friender_id]"

      assert_select "input[name=?]", "friend[friendable_id]"
    end
  end
end
