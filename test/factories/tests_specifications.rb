# frozen_string_literal: true

FactoryBot.define do
  factory :tests_specification do
    association :exercise
    association :language
    tests do
      [build(:test, tests_specification: nil, visible: true),
        build(:test, tests_specification: nil, visible: false)]
    end
    code do
      "n1 = int(input())\n"\
      "n2 = int(input())\n"\
      "print('X =', n1 + n2)"
    end
    limit_time { 1.5 }
    limit_mem { 50 }
  end
end
