FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    full_width_surname    {"田中"}
    full_width_name       {"葵"}
    surname_yomigana      {"タナカ"}
    name_yomigana         {"アオイ"}
    birthday              {"1990-01-01"}
  end
end