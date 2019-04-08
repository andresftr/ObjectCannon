require 'faker'

FactoryBot.define do
  factory :ruby_object do
    number_attributes { Faker::Number.between(1, 25) }
  end

  trait :invalid do
    number_attributes { 'hola' }
  end
end