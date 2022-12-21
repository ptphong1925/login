FactoryBot.define do
  factory :subcomment do
    content { "MyString" }
    status { "MyString" }
    commenter { nil }
    comment { nil }
    likes_count { 1 }
  end
end
