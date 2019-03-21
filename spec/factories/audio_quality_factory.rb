FactoryBot.define do
  factory :audio_quality do
    sequence(:name) { |n| "#{n}-#{Faker::Name.name}" }
    sequence(:abbr) { |n| "#{n}#{Faker::Name.name}" }
    position        { 1 }
    default         { false }
  end
end
