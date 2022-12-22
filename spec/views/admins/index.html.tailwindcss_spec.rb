require 'rails_helper'

RSpec.describe "admins/index", type: :view do
  before(:each) do
    assign(:admins, [
      Admin.create!(
        username: "Username",
        password_digest: "Password Digest",
        first_name: "First Name",
        last_name: "Last Name",
        phone: "Phone",
        token_user: "Token User",
        email: "Email",
        balance: "9.99",
        nation: "Nation",
        follows_count: 2
      ),
      Admin.create!(
        username: "Username",
        password_digest: "Password Digest",
        first_name: "First Name",
        last_name: "Last Name",
        phone: "Phone",
        token_user: "Token User",
        email: "Email",
        balance: "9.99",
        nation: "Nation",
        follows_count: 2
      )
    ])
  end

  it "renders a list of admins" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Username".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Password Digest".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Token User".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Nation".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
