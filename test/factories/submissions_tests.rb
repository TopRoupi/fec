FactoryBot.define do
  factory :submissions_test do
    association :submission
    association :test
    pass { true }
    time_running { 0.5 }
    output { "X = 5\n" }
    errors { '' }
    warnings { '' }
    mem_peak { 0.2 }
  end
end
