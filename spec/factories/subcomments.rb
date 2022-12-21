FactoryBot.define do
  factory :subcomment do
    content { "MyString" }
    status { "MyString" }
    subcommenter { nil }
    comment { nil }
    likes_count { 1 }
  end
end
