FactoryBot.define do
  factory :user do
    sequence(:nickname)               { Faker::Name.name }
    sequence(:email)                  { Faker::Internet.email}
    sequence(:password)               {"12345678"}
    sequence(:password_confirmation)  {"12345678"}
    firstname                         {"田中"}
    lastname                          {"太郎"}
    firstname_kana                    {"タナカ"}
    lastname_kana                     {"タロウ"}
    birth_year                        {"1999"}
    sequence(:birth_month)            {Faker::Number.within(range: 1..12)}
    sequence(:birth_day)              {Faker::Number.within(range: 1..30)}
    sequence(:phone_number)           {"08012341234"}
  end
  
end