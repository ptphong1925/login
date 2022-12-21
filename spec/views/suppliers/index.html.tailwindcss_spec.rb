require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    assign(:suppliers, [
      Supplier.create!(
        name: "Name",
        catalogue: "Catalogue"
      ),
      Supplier.create!(
        name: "Name",
        catalogue: "Catalogue"
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Catalogue".to_s), count: 2
  end
end
