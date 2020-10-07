# frozen_string_literal: true

FactoryBot.define do
  factory :submissions_test do
    association :submission
    association :test
    result { :correct }
    time_running { 0.5 }
    output { "X = 5\n" }
    code_errors { "" }
    compile_output { "" }
    description { "Accepted" }
    process_state { :processed }
    code_warnings { "" }
    mem_peak { 6 }
    factory :wrong_submissions_test do
      result { :incorrect }
      output { "X = 6\n" }
      description { "Wrong Answer" }
    end
  end
end
