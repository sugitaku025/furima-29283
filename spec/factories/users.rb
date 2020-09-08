FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"00000a"}
    password_confirmation {password}
    last_name             {Gimei.last.kanji}
    first_name            {Gimei.first.kanji}
    furigana_last_name    {Gimei.last.katakana}
    furigana_first_name   {Gimei.first.katakana}
    birthday              {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
  end
end