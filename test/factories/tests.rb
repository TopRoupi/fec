FactoryBot.define do
  factory :test do
    association :exercice
    input { "3\n2\n" }
    output { "X = 5\n" }
  end
end
