require 'test_helper'

class PostHitTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:post).counter_cache(:hits_count)
    should belong_to(:user).optional
  end

  context 'validations' do
    should validate_presence_of(:device_token)
    should validate_uniqueness_of(:device_token).scoped_to(:post_id)
  end
end
