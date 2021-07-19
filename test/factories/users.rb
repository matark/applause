FactoryBot.define do
  factory :user do
    name { FFaker::Name.unique.name }
    email { FFaker::Internet.unique.safe_email }
    avatar { FFaker::Avatar.unique.image }
    username { FFaker::Internet.unique.user_name }
    password { FFaker::Internet.password }
  end

  factory :moderator, parent: 'user' do
    role { :moderator }
  end
end
