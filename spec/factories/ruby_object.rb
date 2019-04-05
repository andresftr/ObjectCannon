require 'faker'

FactoryBot.define do
  factory :ruby_oject do
    attacker { Faker::Number.between(1,2) }
    number_attributes { Faker::Number.between(1, 25) }
  end

  trait :invalid_attacker do
    attacker { 3 }
  end

  trait :invalid_attributes do
    number_attributes { 32 }
  end
end