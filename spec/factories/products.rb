FactoryBot.define do
  factory :product do
    association :user
    association :category
    name         { "テスト名のプラン" }
    description  { "テスト用の記述です" }
    period       {"7"}
    price        {"5000"}
    user_id      {"1"}
    category_ids {"1"}
  end
end