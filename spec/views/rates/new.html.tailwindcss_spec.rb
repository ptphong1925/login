require 'rails_helper'

RSpec.describe "rates/new", type: :view do
  before(:each) do
    assign(:rate, Rate.new(
      rate: "MyString",
      rater: nil,
      rateable: nil
    ))
  end

  it "renders new rate form" do
    render

    assert_select "form[action=?][method=?]", rates_path, "post" do

      assert_select "input[name=?]", "rate[rate]"

      assert_select "input[name=?]", "rate[rater_id]"

      assert_select "input[name=?]", "rate[rateable_id]"
    end
  end
end
