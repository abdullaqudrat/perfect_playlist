FactoryBot.define do
  factory :artist, class: Artist do
    name { Faker::Music.band }
  end
end
