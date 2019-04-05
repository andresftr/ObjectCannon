require 'faker'

FactoryBot.define do
  factory :game do
    name { Faker::Name.name }
    rival { Faker::Name.name }

    trait :without_name do
      name { nil }
    end

    trait :without_rival do
      rival { nil }
    end

    trait :same_name do
      rival { name }
    end
  end
end