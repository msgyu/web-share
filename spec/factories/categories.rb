FactoryBot.define do
  factory :category do
    association :product
    name         { "雑食" }
  end
end