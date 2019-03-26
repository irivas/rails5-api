FactoryBot.define do
  factory :movie do
    sequence(:title)  { |n| "#{n}-#{Faker::Name.name}" }
    sequence(:plot)   { Faker::Name.name }
    year              { 2000 }
    duration          { 95 }

    trait :with_video_qualities do
      video_qualities   { build_list(:video_quality, 1) }
    end
  end
end
