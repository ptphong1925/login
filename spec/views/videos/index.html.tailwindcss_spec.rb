require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        title: "Title",
        content: "Content",
        catalogue: "Catalogue",
        status: "Status",
        poster: nil,
        likes_count: 2
      ),
      Video.create!(
        title: "Title",
        content: "Content",
        catalogue: "Catalogue",
        status: "Status",
        poster: nil,
        likes_count: 2
      )
    ])
  end

  it "renders a list of videos" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Content".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Catalogue".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end