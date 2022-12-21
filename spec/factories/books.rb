FactoryBot.define do
  factory :book do
    title { "MyString" }
    status { "MyString" }
    catalogue { "MyString" }
    year_published { 1 }
    isbn { 1 }
    price { "9.99" }
    out_of_print { false }
    views_count { 1 }
    supplier { nil }
    user { nil }
  end
end
