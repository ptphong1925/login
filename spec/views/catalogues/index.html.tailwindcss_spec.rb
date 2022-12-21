require 'rails_helper'

RSpec.describe "catalogues/index", type: :view do
  before(:each) do
    assign(:catalogues, [
      Catalogue.create!(
        name: "Name",
        parent_id: 2
      ),
      Catalogue.create!(
        name: "Name",
        parent_id: 2
      )
    ])
  end

  it "renders a list of catalogues" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
