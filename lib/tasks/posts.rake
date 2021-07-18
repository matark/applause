namespace :posts do
  desc 'Create a post'
  task :create_post => :environment do
    Post.create! do |post|
      post.category = Category.take(5).shuffle.last
      post.title = FFaker::Book.unique.title
      post.body = FFaker::Tweet.unique.body
      post.user = User.take(5).shuffle.last
    end.touch(:published_at)
  end

  desc 'Create a comment'
  task :create_comment => :environment do
    Comment.create! do |comment|
      comment.content = FFaker::Tweet.unique.body
      comment.post = Post.take(5).shuffle.last
      comment.user = User.take(5).shuffle.last
    end
  end
end
