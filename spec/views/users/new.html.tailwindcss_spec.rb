require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      username: "MyString",
      password_digest: "MyString",
      first_name: "MyString",
      last_name: "MyString",
      phone: 1,
      token_user: "MyString",
      email: "MyString",
      balance: "9.99",
      nation: "MyString",
      follows_count: 1,
      role: "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[password_digest]"

      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[last_name]"

      assert_select "input[name=?]", "user[phone]"

      assert_select "input[name=?]", "user[token_user]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[balance]"

      assert_select "input[name=?]", "user[nation]"

      assert_select "input[name=?]", "user[follows_count]"

      assert_select "input[name=?]", "user[role]"
    end
  end
end
