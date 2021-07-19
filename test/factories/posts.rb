FactoryBot.define do
  factory :post do
    title { FFaker::Book.unique.title }
    body { FFaker::Tweet.unique.body }

    association :user, factory: 'user'
    association :category, factory: 'category'
  end
end
