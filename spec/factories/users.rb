FactoryBot.define do
  factory :user do
    sequence(:nickname)                  { Faker::Name.name }
    sequence(:email)                     { Faker::Internet.email}
    sequence(:password)                  {Faker::Internet.password(min_length: 8)}
    sequence(:password_confirmation)     {Faker::Internet.password(min_length: 8)}
    firstname                 {"田中"}
    lastname                  {"太郎"}
    firstname_kana            {"タナカ"}
    lastname_kana             {"タロウ"}
    birth_year                {"1999"}
    sequence(:birth_month)               {Faker::Number.within(range: 1..12)}
    sequence(:birth_day)                 {Faker::Number.within(range: 1..30)}
    sequence(:phone_number)   {Faker::PhoneNumber.phone_number}
  end
  
end