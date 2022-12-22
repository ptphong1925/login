FactoryBot.define do
  factory :friend do
    accepted? { false }
    friender { nil }
    friendable { nil }
  end
end
