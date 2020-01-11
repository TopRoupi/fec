FactoryBot.define do
  factory :user do
    name { Faker::Internet.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
  end
end
