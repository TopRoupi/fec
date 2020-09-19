# frozen_string_literal: true

FactoryBot.define do
  factory :submissions_test do
    association :submission
    association :test
    pass { true }
    time_running { 0.5 }
    output { "X = 5\n" }
    code_errors { "" }
    compile_output { "" }
    description { "Accepted" }
    code_warnings { "" }
    mem_peak { 6 }
    factory :wrong_submissions_test do
      pass { false }
      output { "X = 6\n" }
      description { "Wrong Answer" }
    end
  end
end
