require 'rails_helper'

RSpec.describe "rates/edit", type: :view do
  let(:rate) {
    Rate.create!(
      rate: "MyString",
      rater: nil,
      rateable: nil
    )
  }

  before(:each) do
    assign(:rate, rate)
  end

  it "renders the edit rate form" do
    render

    assert_select "form[action=?][method=?]", rate_path(rate), "post" do

      assert_select "input[name=?]", "rate[rate]"

      assert_select "input[name=?]", "rate[rater_id]"

      assert_select "input[name=?]", "rate[rateable_id]"
    end
  end
end
