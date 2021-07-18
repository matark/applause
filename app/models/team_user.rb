class TeamUser < ApplicationRecord
  belongs_to :team
  belongs_to :user

  enum role: { owner: 0, member: 1, manager: 2 }
  enum state: { pending: 0, accepted: 1, declined: 2 }

  delegate :email, :avatar, :username, to: 'user'
end
