class PostHit < ApplicationRecord
  belongs_to :post, counter_cache: 'hits_count'
  belongs_to :user, optional: true

  validates :device_token, presence: true, uniqueness: { scope: 'post_id' }
end
