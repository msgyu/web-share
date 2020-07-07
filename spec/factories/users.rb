FactoryBot.define do
  factory :user, class: User do
    nickname     { Faker::Name.name }
    email        { Faker::Internet.email}
    password                  {Faker::Internet.password(min_length: 8)}
    password_confirmation     {Faker::Internet.password(min_length: 8)}
    firstname                 {"田中"}
    lastname                  {"太郎"}
    firstname_kana            {"タナカ"}
    lastname_kana             {"タロウ"}
    birth_year                {"1999"}
    birth_month               {Faker::Number.within(range: 1..12)}
    birth_day                 {Faker::Number.within(range: 1..30)}
  end
  
end