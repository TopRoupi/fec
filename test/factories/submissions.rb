FactoryBot.define do
  factory :submission do
    association :user
    association :language
    association :exercice
    code {
            "n1 = int(input())
            n2 = int(input())
            print('X =', n1 + n2)}"
          }
  end
end
