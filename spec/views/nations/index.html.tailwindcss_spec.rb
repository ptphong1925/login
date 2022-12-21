require 'rails_helper'

RSpec.describe "nations/index", type: :view do
  before(:each) do
    assign(:nations, [
      Nation.create!(
        name: "Name"
      ),
      Nation.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of nations" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
