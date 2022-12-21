require 'rails_helper'

RSpec.describe "likes/new", type: :view do
  before(:each) do
    assign(:like, Like.new(
      liker: nil,
      likeable: nil
    ))
  end

  it "renders new like form" do
    render

    assert_select "form[action=?][method=?]", likes_path, "post" do

      assert_select "input[name=?]", "like[liker_id]"

      assert_select "input[name=?]", "like[likeable_id]"
    end
  end
end
