require 'rails_helper'

RSpec.describe "subcomments/edit", type: :view do
  let(:subcomment) {
    Subcomment.create!(
      content: "MyString",
      status: "MyString",
      subcommenter: nil,
      comment: nil,
      likes_count: 1
    )
  }

  before(:each) do
    assign(:subcomment, subcomment)
  end

  it "renders the edit subcomment form" do
    render

    assert_select "form[action=?][method=?]", subcomment_path(subcomment), "post" do

      assert_select "input[name=?]", "subcomment[content]"

      assert_select "input[name=?]", "subcomment[status]"

      assert_select "input[name=?]", "subcomment[subcommenter_id]"

      assert_select "input[name=?]", "subcomment[comment_id]"

      assert_select "input[name=?]", "subcomment[likes_count]"
    end
  end
end
