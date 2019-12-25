FactoryBot.define do
  factory :exercice do
    category { nil }
    language { nil }
    name { "MyString" }
    level { "" }
    content { "MyString" }
    code { "MyString" }
    limit_time { "" }
    limit_mem { "" }
  end
end
