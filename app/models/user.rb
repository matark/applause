class User < ApplicationRecord
  include Discard::Model
  default_scope { kept }

  acts_as_follower
  acts_as_followable
  has_secure_password
  has_secure_token :refresh_token

  has_many :teams
  has_many :team_users
  has_many :related_teams, source: 'team', through: 'team_users'
  has_many :posts, -> { unscope(where: 'published_at') }
  has_many :comments
  has_many :notifications

  enum role: { creator: 0, moderator: 1 }
  enum plan: { plan_free: 0, plan_teams: 1 }

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :username, length: { in: 3..32 }, format: /\A\w[\w\-\.]+\z/
  validates :name, length: { within: 3..32 }, allow_blank: true

  def access_token
    @_access_token ||= generate_access_token
  end

  private

  def generate_access_token
    read_attribute(:refresh_token)
  end

  self.discard_column = :trashed_at
end
