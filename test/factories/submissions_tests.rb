FactoryBot.define do
  factory :submissions_test do
    association :submission
    association :test
    pass { true }
    time_running { 0.5 }
    output { "X = 5\n" }
    code_errors { '' }
    compile_output { '' }
    description { 'Accepted' }
    code_warnings { '' }
    mem_peak { 6 }
  end
end
