1.upto(5).each do
  User.create! do |user|
    user.name = FFaker::Name.unique.name
    user.email = FFaker::Internet.unique.safe_email
    user.avatar = FFaker::Avatar.unique.image
    user.username = FFaker::Internet.unique.user_name
    user.password = FFaker::Internet.password
  end

  Team.create! do |team|
    team.user = User.all.shuffle.last
    team.name = FFaker::Name.unique.name
    team.slug = FFaker::Internet.unique.slug
  end

  Category.create! do |category|
    category.name = FFaker::Music.unique.genre
    category.slug = FFaker::Internet.unique.slug
  end
end
