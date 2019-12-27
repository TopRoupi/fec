FactoryBot.define do
  factory :submissions_test do
    submission { nil }
    test { nil }
    pass { false }
    time_running { 1.5 }
    output { "MyText" }
    errors { "MyText" }
    warnings { "MyText" }
    mem_peak { 1.5 }
  end
end
