require 'rails_helper'

RSpec.describe "follows/index", type: :view do
  before(:each) do
    assign(:follows, [
      Follow.create!(
        follower: nil,
        followable: nil
      ),
      Follow.create!(
        follower: nil,
        followable: nil
      )
    ])
  end

  it "renders a list of follows" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
