FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'password1234' }
    password_confirmation { password }
    last_name { '苗字' }
    first_name { '名前' }
    last_name_furigana { 'ミョウジ' }
    first_name_furigana { 'ナマエ' }
    birthday { '1930-01-01' }
  end
end
