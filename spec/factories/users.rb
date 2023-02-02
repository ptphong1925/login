FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.username }
    password { "password" }
    password_confirmation { "password" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.cell_phone }
    balance { Faker::Number.decimal(l_digits: 3, r_digits: 1) }
    nation { Nation.pluck(:name).sample }
    birtday { Faker::Time.between(from: DateTime.now - 100.years, to: DateTime.now) }
    email { "#{username}@gmail.com" }
    role { ['basic', 'author', 'singer'].sample } 
  end
end
