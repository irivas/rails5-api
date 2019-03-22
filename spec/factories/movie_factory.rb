FactoryBot.define do
  factory :movie do
    sequence(:title)  { |n| "#{n}-#{Faker::Name.name}" }
    sequence(:plot)   { Faker::Name.name }
    year              { 2000 }
    duration          { 95 }
  end
end
