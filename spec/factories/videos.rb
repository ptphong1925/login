FactoryBot.define do
  factory :video do
    title { "MyString" }
    content { "MyString" }
    catalogue { "MyString" }
    status { "MyString" }
    poster { nil }
    likes_count { 1 }
  end
end
