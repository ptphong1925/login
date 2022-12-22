FactoryBot.define do
  factory :user do
    username { "MyString" }
    password_digest { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    phone { "MyString" }
    token_user { "MyString" }
    email { "MyString" }
    balance { "9.99" }
    nation { "MyString" }
    birtday { "2022-12-22 12:31:55" }
    follows_count { 1 }
    role { "MyString" }
  end
end
