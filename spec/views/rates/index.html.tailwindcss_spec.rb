require 'rails_helper'

RSpec.describe "rates/index", type: :view do
  before(:each) do
    assign(:rates, [
      Rate.create!(
        rate: "Rate",
        rater: nil,
        rateable: nil
      ),
      Rate.create!(
        rate: "Rate",
        rater: nil,
        rateable: nil
      )
    ])
  end

  it "renders a list of rates" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Rate".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
