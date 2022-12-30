require 'rails_helper'

RSpec.describe "violations/edit", type: :view do
  let(:violation) {
    Violation.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:violation, violation)
  end

  it "renders the edit violation form" do
    render

    assert_select "form[action=?][method=?]", violation_path(violation), "post" do

      assert_select "input[name=?]", "violation[name]"
    end
  end
end
