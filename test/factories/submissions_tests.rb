FactoryBot.define do
  factory :submissions_test do
    submission { nil }
    test { nil }
    pass { false }
    time_running { "" }
    output { "MyString" }
    errors { "MyString" }
    warnings { "MyString" }
    mem_peak { "" }
  end
end
