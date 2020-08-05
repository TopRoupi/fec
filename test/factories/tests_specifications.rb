FactoryBot.define do
  factory :tests_specification do
    association :exercice
    association :language
    tests { [ build(:test, tests_specification: nil, visible: true),
              build(:test, tests_specification: nil, visible: false) ] }
    code {
            "n1 = int(input())\n"\
            "n2 = int(input())\n"\
            "print('X =', n1 + n2)"
          }
    limit_time { 1.5 }
    limit_mem { 50 }
  end
end
