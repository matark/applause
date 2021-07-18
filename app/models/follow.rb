class Follow < ApplicationRecord
  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  belongs_to :follower, polymorphic: true
  belongs_to :followable, polymorphic: true

  def block!
    update_attribute(:blocked, true)
  end
end
