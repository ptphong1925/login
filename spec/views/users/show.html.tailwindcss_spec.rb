require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      username: "Username",
      password_digest: "Password Digest",
      first_name: "First Name",
      last_name: "Last Name",
      phone: 2,
      token_user: "Token User",
      email: "Email",
      balance: "9.99",
      nation: "Nation",
      follows_count: 3,
      role: "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Token User/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Nation/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Role/)
  end
end
