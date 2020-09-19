# frozen_string_literal: true

FactoryBot.define do
  factory :submission do
    association :user
    association :language
    submissions_tests { [build(:submissions_test, submission: nil)] }
    association :exercice
    code do
      "n1 = int(input())\n"\
      "n2 = int(input())\n"\
      "print('X =', n1 + n2)"
    end
    factory :wrong_submission do
      submissions_tests { [build(:wrong_submissions_test, submission: nil)] }
    end
  end
end
