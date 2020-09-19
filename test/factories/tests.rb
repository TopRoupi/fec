# frozen_string_literal: true

FactoryBot.define do
  factory :test do
    association :tests_specification
    input { "3\n2\n" }
    output { "X = 5\n" }
    visible { true }
  end
end
