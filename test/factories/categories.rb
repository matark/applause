FactoryBot.define do
  factory :category do
    name { FFaker::Music.unique.genre }
    slug { FFaker::Internet.unique.slug }
  end
end
