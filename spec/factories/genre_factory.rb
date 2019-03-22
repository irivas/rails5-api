FactoryBot.define do
  factory :genre do
    sequence(:name) { |n| "#{n}-#{Faker::Name.name}" }
  end
end
