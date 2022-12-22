require 'rails_helper'

RSpec.describe "friends/edit", type: :view do
  let(:friend) {
    Friend.create!(
      accepted?: false,
      friender: nil,
      friendable: nil
    )
  }

  before(:each) do
    assign(:friend, friend)
  end

  it "renders the edit friend form" do
    render

    assert_select "form[action=?][method=?]", friend_path(friend), "post" do

      assert_select "input[name=?]", "friend[accepted?]"

      assert_select "input[name=?]", "friend[friender_id]"

      assert_select "input[name=?]", "friend[friendable_id]"
    end
  end
end
