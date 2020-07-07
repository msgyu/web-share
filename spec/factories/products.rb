FactoryBot.define do
  factory :product do
    association :user
    name        { "テスト名のプラン" }
    description { "テスト用の記述です" }
    period      {"7"}
    price       {"5000"}
  end
end