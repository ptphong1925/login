require 'rails_helper'

RSpec.describe "admins/edit", type: :view do
  let(:admin) {
    Admin.create!(
      username: "MyString",
      password_digest: "MyString",
      first_name: "MyString",
      last_name: "MyString",
      phone: 1,
      token_user: "MyString",
      email: "MyString",
      balance: "9.99",
      nation: "MyString",
      follows_count: 1
    )
  }

  before(:each) do
    assign(:admin, admin)
  end

  it "renders the edit admin form" do
    render

    assert_select "form[action=?][method=?]", admin_path(admin), "post" do

      assert_select "input[name=?]", "admin[username]"

      assert_select "input[name=?]", "admin[password_digest]"

      assert_select "input[name=?]", "admin[first_name]"

      assert_select "input[name=?]", "admin[last_name]"

      assert_select "input[name=?]", "admin[phone]"

      assert_select "input[name=?]", "admin[token_user]"

      assert_select "input[name=?]", "admin[email]"

      assert_select "input[name=?]", "admin[balance]"

      assert_select "input[name=?]", "admin[nation]"

      assert_select "input[name=?]", "admin[follows_count]"
    end
  end
end
