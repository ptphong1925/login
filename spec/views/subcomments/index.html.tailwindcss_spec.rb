require 'rails_helper'

RSpec.describe "subcomments/index", type: :view do
  before(:each) do
    assign(:subcomments, [
      Subcomment.create!(
        content: "Content",
        status: "Status",
        subcommenter: nil,
        comment: nil,
        likes_count: 2
      ),
      Subcomment.create!(
        content: "Content",
        status: "Status",
        subcommenter: nil,
        comment: nil,
        likes_count: 2
      )
    ])
  end

  it "renders a list of subcomments" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Content".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
