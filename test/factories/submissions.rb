# frozen_string_literal: true

FactoryBot.define do
  factory :submission do
    association :user
    association :language
    association :exercise
    code do
      "n1 = int(input())\n"\
      "n2 = int(input())\n"\
      "print('X =', n1 + n2)"
    end
    factory :wrong_submission do
      code do
        "n1 = int(input())\n"\
        "n2 = int(input())\n"\
        "print('x=', n1 + n2)"
      end
    end
  end
end
