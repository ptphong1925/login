FactoryBot.define do
  factory :admin do
    username { "MyString" }
    password_digest { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    phone { 1 }
    token_user { "MyString" }
    email { "MyString" }
    balance { "9.99" }
    nation { "MyString" }
    birtday { "2022-12-21 22:38:02" }
    follows_count { 1 }
  end
end
