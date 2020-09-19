# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    association :owner, factory: :user
    name { "list" }
    description { "sure it is" }
    privacy { :private_list }
  end
end
