FactoryBot.define do
  factory :movie do
    sequence(:title)  { |n| "#{n}-#{Faker::Name.name}" }
    sequence(:plot)   { Faker::Name.name }
    year              { 2000 }
    duration          { 95 }

    trait :with_audio_qualities do
      audio_qualities   { build_list(:audio_quality, 1) }
    end

    trait :with_video_qualities do
      video_qualities   { build_list(:video_quality, 1) }
    end

    trait :with_genres do
      genres   { build_list(:genre, 1) }
    end
  end
end
