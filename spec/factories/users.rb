FactoryBot.define do
  factory :user do
    email { Faker::Internet.email(domain: 'gmail') }
    username { Faker::Internet.username }
    password { "password" }
    password_confirmation { "password" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.cell_phone }
    # token_user { "MyString" }
    balance { Faker::Number.decimal(l_digits: 3, r_digits: 1) }
    nation { Faker::Nation.nationality }
    birtday { Faker::Time.between(from: DateTime.now - 100.years, to: DateTime.now) }
    # follows_count { 1 }
    # role { "basic" }
  end

  factory :author, parent: :user do
    role { :author }
  end

  factory :singer, parent: :user do
    role { :singer }
  end

end
