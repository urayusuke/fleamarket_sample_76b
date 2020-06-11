FactoryBot.define do
  factory :user do
    nickname           {"test"}
    last_name          {"a"}
    first_name         {"a"}
    last_name_kana     {"a"}
    first_name_kana    {"a"}
    birthday           {"1997-12-01"}
    email              {"aa@aa"}
    password           {11111111}
  end
end