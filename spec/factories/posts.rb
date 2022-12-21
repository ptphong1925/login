FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyString" }
    catalogue { "MyString" }
    status { "MyString" }
    poster { nil }
    likes_count { 1 }
  end
end
