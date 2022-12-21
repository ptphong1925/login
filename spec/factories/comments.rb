FactoryBot.define do
  factory :comment do
    content { "MyString" }
    status { "MyString" }
    commenter { nil }
    commentable { nil }
    likes_count { 1 }
  end
end
